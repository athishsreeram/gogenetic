package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"runtime"

	natscon "{{.API.Name}}-{{.Architechture.Name}}-output/client/nats/con"
	"{{.API.Name}}-{{.Architechture.Name}}-output/servicetodomain"
	cfg "{{.API.Name}}-{{.Architechture.Name}}-output/config"

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
	var configPath string
	var subj string

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	flag.StringVar(&configPath, "config-path", dir+"/../../../config-dev.json", "Config Path")
	flag.StringVar(&subj, "sub", "Test", "Test Path")

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

	args := flag.Args()
	if len(args) != 1 {
		usage()
	}

	nc, _ := natscon.ConnectNATSSub(urls, userCreds)

	i := 0

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
	if showTime == true {
		log.SetFlags(log.LstdFlags)
	}

	runtime.Goexit()
}