package config

import (
	"log"

	"github.com/tkanos/gonfig"
)

// Config is configuration for Server
type Config struct {
	// gRPC server start parameters section
	// gRPC is TCP port to listen by gRPC server
	GRPCPort string

	HTTPPort string

	DBCon string
}

var (
	Conf *Config
)

func GetConfig(path string) *Config {
	configuration := Config{}
	err := gonfig.GetConf(path, &configuration)

	if err != nil {
		log.Println(path)
		log.Println(err)
		panic(err)
	}

	return &configuration
}
