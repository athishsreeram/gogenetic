package main

import (
	"bytes"
	"fmt"
	"log"
	"os"

	"io/ioutil"

	"flag"

	"github.com/BurntSushi/toml"
	"github.com/gobuffalo/packr"
	"github.com/spf13/viper"

	"gogenetic/arch"
	"gogenetic/data"
	"gogenetic/gogfile"
)

func main() {

	box := packr.NewBox("./config")

	viper.SetConfigType("toml")

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	//0. Argument Options Simple CLI with go-command-line-flags
	tomlFile := flag.String("tomlFile", dir+"/toml/test.toml", " Input the TOML File.")
	archType := flag.String("archType", "es-cqrs", "Architechture Type")
	outDir := flag.String("outDir", "output", " Output directory")
	lang := flag.String("lang", "go", " Input the language")
	templateFile := flag.String("templateFile", "go/proto-grpctemplate.tpl", " Input the TOML File.")

	flag.Parse()

	//1. Load TOML file
	tomlData, err := ioutil.ReadFile(*tomlFile)
	if err != nil {
		log.Fatal(err)
	}

	//2. Parse & Load value dynamically from given input toml
	var conf data.AutoGeneratedCli
	if _, err := toml.Decode(string(tomlData), &conf); err != nil {
		log.Fatal(err)
	}
	conf.Gogenetic.TomlDir = *tomlFile
	conf.Gogenetic.Dir = dir
	conf.Gogenetic.OutDir = *outDir
	conf.Gogenetic.Lang = *lang

	if *archType != "file" {
		archConfig := conf.Gogenetic.Lang + "/" + conf.Gogenetic.Lang + "-arch-config.toml"
		utilConfig := conf.Gogenetic.Lang + "/" + conf.Gogenetic.Lang + "-file-config.toml"

		archConfigFile, err := box.FindString(archConfig)
		if err != nil {
			log.Fatal(err)
		}

		err = viper.ReadConfig(bytes.NewBuffer([]byte(archConfigFile)))
		if err != nil {
			fmt.Println("Config not found...")
		}

		utilConfigFile, err := box.FindString(utilConfig)
		if err != nil {
			log.Fatal(err)
		}

		err = viper.MergeConfig(bytes.NewBuffer([]byte(utilConfigFile)))
		if err != nil {
			fmt.Println("Config not found...")
		}
	}

	if *archType == "file" {
		gogfile.CreateFile(conf, *templateFile, conf.Gogenetic.OutDir)
	}

	if conf.Gogenetic.Lang == "go" {
		arch.GoLangArchConf(conf, *archType)
	}

	if conf.Gogenetic.Lang == "java" {
		arch.JavaLangArchConf(conf, *archType)
	}

	if conf.Gogenetic.Lang == "liquibase" {
		gogfile.CreateFile(conf, "liquibase/liquibasetemplate.tpl", conf.Gogenetic.OutDir)
	}
}
