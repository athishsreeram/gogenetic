package pub

import (
	"log"

	"flag"

	"github.com/nats-io/go-nats"
)

var nc *nats.Conn

func Send(subj string, msg string) {
	var urls = flag.String("s", nats.DefaultURL, "The nats server URLs (separated by comma)")
	var err error
	nc, err = nats.Connect(*urls)
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

func Test() (out string) {
	return "nil"
}
