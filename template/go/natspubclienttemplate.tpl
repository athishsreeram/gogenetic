package pub

import (
	"encoding/json"
	"log"
	"strings"

	natscon "{{.API.Name}}-{{.Architechture.Name}}-output/client/nats/con"

	"github.com/nats-io/go-nats"
)

var nc *nats.Conn
var delimiter = "=@="

func Send(subj string,key string, v interface{}) {
	var urls = nats.DefaultURL
	var userCreds = ""
	var err error

	msg, err := json.Marshal(v)
	if err != nil {
		log.Println(err)
	}

	var msgStr strings.Builder
	msgStr.WriteString(key)
	msgStr.WriteString(delimiter)
	msgStr.Write(msg)

	nc, err := natscon.ConnectNATSPub(urls, userCreds)

	if err != nil {
		log.Println(err)
	}
	defer nc.Close()

	nc.Publish(subj, []byte(msgStr.String()))
	nc.Flush()

	if err := nc.LastError(); err != nil {
		log.Fatal(err)
	} else {
		log.Printf("Published [%s] : '%s'\n", subj, msgStr.String())
	}
}