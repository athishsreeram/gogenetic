package main

import (
	"context"
	"flag"
	"fmt"

	grpc "{{.API.Name}}-{{.Architechture.Name}}-output/server/grpc"
	rest "{{.API.Name}}-{{.Architechture.Name}}-output/server/rest"
)

// Config is configuration for Server
type Config struct {
	// gRPC server start parameters section
	// gRPC is TCP port to listen by gRPC server
	GRPCPort string

	HTTPPort string
}

// RunServer runs gRPC server and HTTP gateway
func main() {
	ctx := context.Background()

	// get configuration
	var cfg Config
	flag.StringVar(&cfg.GRPCPort, "grpc-port", "4040", "gRPC port to bind")
	flag.StringVar(&cfg.HTTPPort, "http-port", "8080", "HTTP port to bind")

	flag.Parse()

	if len(cfg.GRPCPort) == 0 {
		 fmt.Errorf("invalid TCP port for gRPC server: '%s'", cfg.GRPCPort)
	}

	if len(cfg.HTTPPort) == 0 {
		 fmt.Errorf("invalid HTTP port for HTTP server: '%s'", cfg.HTTPPort)
	}

	go func() {
		_ = rest.RunServer(ctx, cfg.GRPCPort, cfg.HTTPPort)
	}()

	grpc.RunServer(ctx, cfg.GRPCPort)

}
