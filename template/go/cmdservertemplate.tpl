package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"os"

	grpc "{{.API.Name}}-{{.Architechture.Name}}-output/server/grpc"
	rest "{{.API.Name}}-{{.Architechture.Name}}-output/server/rest"
	cfg "{{.API.Name}}-{{.Architechture.Name}}-output/config"
)

// RunServer runs gRPC server and HTTP gateway
func main() {
	ctx := context.Background()

	var configPath string

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	flag.StringVar(&configPath, "config-path", dir+"/../../config-dev.json", "Config Path")

	flag.Parse()

	if len(configPath) == 0 {
		fmt.Errorf("invalid Config Path: '%s'", configPath)
	}

	cfg.Conf = cfg.GetConfig(configPath)

	log.Println(cfg.Conf)

	go func() {
		_ = rest.RunServer(ctx, cfg.Conf.GRPCPort, cfg.Conf.HTTPPort)
	}()

	grpc.RunServer(ctx, cfg.Conf.GRPCPort)

}