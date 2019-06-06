package main

import (
	"gogenetic/gogfile"
	"log"
	"os"

	"flag"
)

func main() {

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	log.Println(dir)

	//0. Argument Options Simple CLI with go-command-line-flags
	tomlFile := flag.String("tomlFile", dir+"/toml/test.toml", " Input the TOML File.")
	templateFile := flag.String("templateFile", "go/proto-grpctemplate.tpl", " Input the TOML File.")
	outDir := flag.String("outDir", "output", " Input the TOML File.")
	flag.Parse()

	gogfile.CreateFile(*tomlFile, *templateFile, *outDir)

}
