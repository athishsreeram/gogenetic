package main

import (
	"flag"
	"log"
	"runtime"

	natscon "{{.API.Name}}-output/client/nats/con"
	"{{.API.Name}}-output/servicetodomain"

	"github.com/nats-io/go-nats"
)

// NOTE: Can test with demo servers.
// nats-sub -s demo.nats.io <subject>
// nats-sub -s demo.nats.io:4443 <subject> (TLS version)

func usage() {
	log.Printf("Usage: nats-sub [-s server] [-creds file] [-t] <subject>\n")
	flag.PrintDefaults()
}

func main() {
	var urls = flag.String("s", nats.DefaultURL, "The nats server URLs (separated by comma)")
	var userCreds = flag.String("creds", "", "User Credentials File")
	var showTime = flag.Bool("t", false, "Display timestamps")

	log.SetFlags(0)
	flag.Usage = usage
	flag.Parse()

	args := flag.Args()
	if len(args) != 1 {
		usage()
	}

	var urlIn, userCredsIn string

	if urls != nil { // Check for nil!
		urlIn = *urls
	}

	if userCreds != nil {
		userCredsIn = *userCreds
	}

	nc, _ := natscon.ConnectNATSSub(urlIn, userCredsIn)

	subj, i := args[0], 0

	nc.Subscribe(subj, func(msg *nats.Msg) {
		i += 1
		natscon.PrintMsg(msg, i)
		servicetodomain.TestServiceProcesing(string(msg.Data))
	})
	nc.Flush()

	if err := nc.LastError(); err != nil {
		log.Fatal(err)
	}

	log.Printf("Listening on [%s]", subj)
	if *showTime {
		log.SetFlags(log.LstdFlags)
	}

	runtime.Goexit()
}

