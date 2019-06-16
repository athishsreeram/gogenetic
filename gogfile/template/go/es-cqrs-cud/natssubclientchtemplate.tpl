package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"runtime"

	natscon "{{.Architechture.Outputdir}}/client/nats/con"
	"{{.Architechture.Outputdir}}/servicetodomain"
	cfg "{{.Architechture.Outputdir}}/config"

	"github.com/Jeffail/gabs"
	"github.com/nats-io/nats.go"
)

// NOTE: Can test with demo servers.
// nats-sub -s demo.nats.io <subject>
// nats-sub -s demo.nats.io:4443 <subject> (TLS version)

func usage() {
	log.Printf("Usage: nats-sub [-s server] [-creds file] [-t] <subject>\n")
	flag.PrintDefaults()
}

func main() {

	var configPath string

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	flag.StringVar(&configPath, "config-path", dir+"/config-dev.json", "Config Path")

	flag.Parse()

	if len(configPath) == 0 {
		fmt.Errorf("invalid Config Path: '%s'", configPath)
	}

	cfg.Conf = cfg.GetConfig(configPath)

	log.Println(cfg.Conf)

	var urls = cfg.Conf.NATSurl
	var userCreds = cfg.Conf.UserCreds
	var showTime = cfg.Conf.ShowTime

	log.SetFlags(0)
	flag.Usage = usage
	flag.Parse()

	subj := cfg.Conf.NATSSubj
	if len(subj) != 1 {
		usage()
	}

	nc, _ := natscon.ConnectNATSSub(urls, userCreds)

	i := 0

	nc.Subscribe(subj, func(msg *nats.Msg) {
		i += 1
		natscon.PrintMsg(msg, i)
		jsonObj, _ := gabs.ParseJSON(msg.Data)

		if jsonObj.ExistsP("command") == true && jsonObj.ExistsP("event") == false {
			servicetodomain.{{.API.Name}}CommandToEvent(string(msg.Data))
		}

	})
	nc.Flush()

	if err := nc.LastError(); err != nil {
		log.Fatal(err)
	}

	log.Printf("Listening on [%s]", subj)
	if showTime == true {
		log.SetFlags(log.LstdFlags)
	}

	runtime.Goexit()
}