package pub

import (
	"log"

	"github.com/nats-io/go-nats"
)

var nc *nats.Conn

func Send(subj string, msg string) {
	var err error
	nc, err = nats.Connect(nats.DefaultURL)
	if err != nil {
		log.Println(err)
	}
	defer nc.Close()

	nc.Publish(subj, []byte(msg))
	nc.Flush()

	if err := nc.LastError(); err != nil {
		log.Fatal(err)
	} else {
		log.Printf("Published [%s] : '%s'\n", subj, msg)
	}
}