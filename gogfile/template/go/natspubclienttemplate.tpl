package pub

import (
	"encoding/json"
	"log"

	natscon "{{.Architechture.Outputdir}}/client/nats/con"
	cfg "{{.Architechture.Outputdir}}/config"
	gabs "github.com/Jeffail/gabs"
	"github.com/nats-io/nats.go"
)

var nc *nats.Conn

func Send(subj string,key string, v interface{}) {
	var urls = cfg.Conf.NATSurl
	var userCreds = cfg.Conf.UserCreds
	var err error


	nc, err := natscon.ConnectNATSPub(urls, userCreds)

	if err != nil {
		log.Println(err)
	}
	defer nc.Close()
	
	msg, err := json.Marshal(v)
	if err != nil {
		log.Println(err)
	}

	jsonObj, err := gabs.ParseJSON(msg)
	jsonObj.SetP(key, "command")
	log.Println(jsonObj)

	
    nc.Publish(subj, msg)
	nc.Flush()

	if err := nc.LastError(); err != nil {
		log.Fatal(err)
	} else {
		 log.Printf("Published [%s] : '%s'\n", subj, string(msg))
	}
}