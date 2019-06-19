package main

import (
	"log"
	"os"

	"io/ioutil"

	"flag"

	"github.com/BurntSushi/toml"

	"gogenetic/arch"
	"gogenetic/data"
	"gogenetic/gogfile"
)

func main() {

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

	//go run gogentic.go /Users/anharay/go/src/gogenetic/toml/test.toml /Users/anharay/go/src/gogenetic/template/grpctemplate.goproto
	//1. Load TOML file
	tomlData, err := ioutil.ReadFile(*tomlFile)
	if err != nil {
		log.Fatal(err)
	}
	//log.Print("Parsed TOML")
	//log.Print(string(tomlData))

	//2. Set value
	var conf data.AutoGeneratedCli

	//3. Parse & Load value dynamically from given input toml
	//log.Print("Parsed & Load value into Generated Structs from Create & copied from https://xuri.me/toml-to-go/")
	var confToml data.AutoGeneratedCli
	if _, err := toml.Decode(string(tomlData), &confToml); err != nil {
		log.Fatal(err)
	}
	conf.API.Name = confToml.API.Name
	conf.Gogenetic.TomlDir = *tomlFile
	conf.Gogenetic.Dir = dir
	conf.Gogenetic.OutDir = *outDir
	conf.Gogenetic.Lang = *lang
	conf.Models = confToml.Models

	if *archType == "file" {
		gogfile.CreateFile(conf, *templateFile, conf.Gogenetic.OutDir)
	}

	if conf.Gogenetic.Lang == "go" {
		arch.GoLangArch(conf, *archType, *templateFile)
	}

	if conf.Gogenetic.Lang == "java" {
		arch.JavaLangArch(conf, *archType, *templateFile)
	}

    if conf.Gogenetic.Lang == "liquibase" {
    	 gogfile.CreateFile(conf, "liquibase/liquibasetemplate.tpl", conf.Gogenetic.OutDir)
    }
}
