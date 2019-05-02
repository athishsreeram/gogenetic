package main

import (
	"fmt"
	"html/template"
	"log"
	"os"

	"io/ioutil"

	"github.com/BurntSushi/toml"

	"flag"
	"strings"
)

var fns = template.FuncMap{
	"plus1": func(x int) int {
		return x + 1
	}, "minus1": func(x int) int {
		x = x - 1
		return x
	}, "convertswagger": func(x string) string {
		if x == "int" {
			return "integer"
		}
		return ""
	}, "convertproto": func(x string) string {
		if x == "int" {
			return "int64"
		}
		return ""
	}, "lowercase": func(x string) string {
		return strings.ToLower(x)
	}, "titlecase": func(x string) string {
		return strings.Title(x)
	},
}

// Create & copied from https://xuri.me/toml-to-go/

type AutoGenerated struct {
	API struct {
		Name       string `toml:"Name"`
		Operations []struct {
			URL         string `toml:"url"`
			Request     string `toml:"request"`
			Response    string `toml:"response"`
			Protocol    string `toml:"protocol"`
			Operationid string `toml:"operationid"`
		} `toml:"Operations"`
	} `toml:"API"`
	Models struct {
		Model []struct {
			Name     string `toml:"name"`
			Variable []struct {
				Name  string `toml:"name"`
				Value string `toml:"value"`
				Type  string `toml:"type"`
			} `toml:"Variable"`
		} `toml:"Model"`
	} `toml:"Models"`
}

// Create & copied from https://xuri.me/toml-to-go/

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func fileloc(templateFile string) string {
	if strings.Contains(templateFile, "proto-") {
		return "proto/"
	}
	if strings.Contains(templateFile, "cmd") {
		return "cmd/"
	}
	if strings.Contains(templateFile, "grpcserver") {
		return "server/"
	}
	if strings.Contains(templateFile, "service") {
		return "service/v1/"
	}
	if strings.Contains(templateFile, "client") {
		return "client/v1/"
	}

	return ""

}

func fileName(templateFile string, apiName string) string {

	if strings.Contains(templateFile, "proto-") {
		return apiName + "-service.proto"
	}
	if strings.Contains(templateFile, "cmd") {
		return apiName + "-cmdserver.go"
	}
	if strings.Contains(templateFile, "grpcserver") {
		return apiName + "-server.go"
	}
	if strings.Contains(templateFile, "swagger") {
		return apiName + "-swagger.yml"
	}
	if strings.Contains(templateFile, "service") {
		return apiName + "-service.go"
	}
	if strings.Contains(templateFile, "client") {
		return apiName + "-client.go"
	}

	return ""

}

func CreateDirIfNotExist(dir string) {
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		err = os.MkdirAll(dir, 0755)
		if err != nil {
			panic(err)
		}
	}
}

func main() {

	os.Chdir("../")

	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(dir)

	//0. Argument Options Simple CLI with go-command-line-flags
	tomlFile := flag.String("tomlFile", dir+"/toml/test.toml", " Input the TOML File.")
	templateFile := flag.String("templateFile", dir+"/template/grpctemplate.goproto", " Input the TOML File.")
	flag.Parse()

	//go run gogentic.go /Users/anharay/go/src/gogenetic/toml/test.toml /Users/anharay/go/src/gogenetic/template/grpctemplate.goproto
	//1. Load TOML file
	tomlData, err := ioutil.ReadFile(*tomlFile)
	check(err)
	log.Print("Parsed TOML")
	log.Print(string(tomlData))

	//2. Load Template
	tmpl, err := ioutil.ReadFile(*templateFile)
	check(err)
	log.Print("Parsed Template")
	log.Print(string(tmpl))

	//3. Parse & Load value dynamically
	var conf AutoGenerated
	if _, err := toml.Decode(string(tomlData), &conf); err != nil {
		log.Fatal(err)
	}
	log.Print("Parsed & Load value into Generated Structs from Create & copied from https://xuri.me/toml-to-go/")
	log.Printf("title: %s", conf.Models.Model[0].Name)

	log.Print("Create a goTemplate and Pass TOML struts Value to create the final grpc file")
	//4. Create Template and Pass TOML Value
	t := template.New("GRPC template")

	t1, err := t.Funcs(fns).Parse(string(tmpl))
	if err != nil {
		log.Fatal("Parse: ", err)
		return
	}
	log.Println("Output:" + dir + "/output/" + fileloc(*templateFile) + fileName(*templateFile, conf.API.Name))
	CreateDirIfNotExist(dir + "/output/" + fileloc(*templateFile))

	f, err := os.Create(dir + "/output/" + fileloc(*templateFile) + fileName(*templateFile, conf.API.Name))
	if err != nil {
		log.Println("create file: ", err)
		return
	}

	err = t1.Execute(f, conf)
	if err != nil {
		log.Fatal("Execute: ", err)
		return
	}

	f.Close()

}