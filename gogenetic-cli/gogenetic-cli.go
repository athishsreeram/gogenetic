package main

import (
	"html/template"
	"log"
	"os"

	"io/ioutil"

	"flag"
	"strings"

	"github.com/BurntSushi/toml"
)

var fnsCli = template.FuncMap{
	"plus1": func(x int) int {
		return x + 1
	}, "minus1": func(x int) int {
		x = x - 1
		return x
	}, "convertswagger": func(x string) string {
		if x == "int" {
			return "integer"
		}
		if x == "string" {
			return "string"
		}
		return ""
	}, "convertproto": func(x string) string {
		if x == "int" {
			return "int64"
		}
		if x == "string" {
			return "string"
		}
		if x == "repeated" {
			return "repeated"
		}
		if x == "object" {
			return "object"
		}
		if x == "boolean" {
			return "bool"
		}
		return ""
	}, "lowercase": func(x string) string {
		return strings.ToLower(x)
	}, "titlecase": func(x string) string {
		return strings.Title(x)
	}, "uppercase": func(x string) string {
		return strings.ToUpper(x)
	}, "removeplural": func(x string) string {
		a := []rune(x)
		return string(a[0 : len(a)-1])
	}, "firstsmall": func(x string) string {
		a := []rune(x)

		var msgStr strings.Builder
		msgStr.WriteString(strings.ToLower(string(a[0:1])))
		msgStr.WriteString(string(a[1:len(a)]))

		return msgStr.String()
	},
}

// AutoGeneratedCli Create & copied from https://xuri.me/toml-to-go/
type AutoGeneratedCli struct {
	Gogenetic struct {
		Apiname              string `toml:"Apiname"`
		Shname               string `toml:"Shname"`
		TomlDir              string `toml:"TomlDir"`
		Tomlesread           string `toml:"Tomlesread"`
		Escqrsread           string `toml:"Escqrsread"`
		Esreadoutput         string `toml:"Esreadoutput"`
		Eventstorereadoutput string `toml:"eventstorereadoutput"`
		Cudoutput            string `toml:"Cudoutput"`
		Escqrscud            string `toml:"Escqrscud"`
		Dir                  string `toml:"Dir"`
		Cud                  string `toml:"Cud"`
		Read                 string `toml:"Read"`
		Eventsource          string `toml:"Eventsource"`
		Crud                 string `toml:"Crud"`
		Crudoutput           string `toml:"Crudoutput"`
		Eswithoutcqrsoutput  string `toml:"Eswithoutcqrsoutput"`
		Eswithoutcqrs        string `toml:"Eswithoutcqrs"`
	} `toml:"Gogenetic"`
	API struct {
		Name string `toml:"Name"`
	} `toml:"API"`
}

func checkCli(e error) {
	if e != nil {
		panic(e)
	}
}

func filelocCli(templateFile string) string {
	if strings.Contains(templateFile, "cli") {
		return "cli/"
	}

	return ""

}

func fileNameCli(templateFile string, apiName string) string {

	if strings.Contains(templateFile, "cli") {
		return apiName + ".sh"
	}

	return ""

}

func createDirIfNotExistCli(dir string) {
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
	log.Println(dir)
	dir = dir + "/gogenetic"

	//0. Argument Options Simple CLI with go-command-line-flags
	tomlFile := flag.String("tomlFile", dir+"/toml/test.toml", " Input the TOML File.")
	archType := flag.String("archType", "es-cqrs", "Architechture Type")
	outDir := flag.String("outDir", "shoutput", " Input the TOML File.")
	flag.Parse()

	//go run gogentic.go /Users/anharay/go/src/gogenetic/toml/test.toml /Users/anharay/go/src/gogenetic/template/grpctemplate.goproto
	//1. Load TOML file
	tomlData, err := ioutil.ReadFile(*tomlFile)
	checkCli(err)
	//log.Print("Parsed TOML")
	//log.Print(string(tomlData))
	var templateFile string

	//2. Set value
	var conf AutoGeneratedCli

	//3. Parse & Load value dynamically from given input toml
	//log.Print("Parsed & Load value into Generated Structs from Create & copied from https://xuri.me/toml-to-go/")
	var confToml AutoGeneratedCli
	if _, err := toml.Decode(string(tomlData), &confToml); err != nil {
		log.Fatal(err)
	}

	//4. Set Value to the CLI Stucts input
	if *archType == "es-cqrs" {
		templateFile = dir + "/template/gocli/eventsource-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-with-cqrs-run"
		conf.Gogenetic.Tomlesread = dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = dir + "/template/go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = "/output/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = "/output/eventstore-read-output"
		conf.Gogenetic.Cudoutput = "/output/es-cud-output"

	}

	if *archType == "es-async-cqrs" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-async-with-cqrs-run"
		conf.Gogenetic.Tomlesread = dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = dir + "/template/go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = "/output/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = "/output/eventstore-read-output"
		conf.Gogenetic.Cudoutput = "/output/es-cud-output"
		conf.Gogenetic.Read = "True"
		conf.Gogenetic.Cud = "True"
		conf.Gogenetic.Eventsource = "True"

	}

	if *archType == "es-async-cqrs-read" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-async-with-cqrs-read-run"
		conf.Gogenetic.Tomlesread = dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = dir + "/template/go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = "/output/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = "/output/eventstore-read-output"
		conf.Gogenetic.Cudoutput = "/output/es-cud-output"
		conf.Gogenetic.Read = "True"
		conf.Gogenetic.Cud = "Flase"
		conf.Gogenetic.Eventsource = "Flase"

	}

	if *archType == "es-cqrs-eventstore-read" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-eventstore-read-run"
		conf.Gogenetic.Tomlesread = dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = dir + "/template/go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = "/output/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = "/output/eventstore-read-output"
		conf.Gogenetic.Cudoutput = "/output/es-cud-output"
		conf.Gogenetic.Read = "False"
		conf.Gogenetic.Cud = "Flase"
		conf.Gogenetic.Eventsource = "True"

	}

	if *archType == "es-async-cqrs-cmd-event-handler-cud" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-async-with-cqrs-cmd-event-handler-run"
		conf.Gogenetic.Tomlesread = dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = dir + "/template/go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = "/output/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = "/output/eventstore-read-output"
		conf.Gogenetic.Cudoutput = "/output/es-cud-output"
		conf.Gogenetic.Read = "False"
		conf.Gogenetic.Cud = "True"
		conf.Gogenetic.Eventsource = "False"

	}

	if *archType == "es-async-cmdhandler-cqrs" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-cmdhandler-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-async-with-cqrs-cmdhandler-run"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Cudoutput = "/output/es-cmdhandler-cud-output"

	}

	if *archType == "es-async-eventhandler-cqrs" {
		templateFile = dir + "/template/gocli/eventsource-async-cqrs-eventhandler-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-async-with-cqrs-eventhandler-run"
		conf.Gogenetic.Escqrscud = dir + "/template/go/es-cqrs-cud/"
		conf.Gogenetic.Cudoutput = "/output/es-eventhandler-cud-output"

	}

	if *archType == "crud" {
		templateFile = dir + "/template/gocli/crud-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-crud-run"
		conf.Gogenetic.Crud = dir + "/template/go/"
		conf.Gogenetic.Crudoutput = "/output/crud"

	}

	if *archType == "es-without-cqrs" {
		templateFile = dir + "/template/gocli/eventsource-without-cqrs-cli.tpl"

		conf.Gogenetic.Shname = "gogenetic-es-without-cqrs-run"
		conf.Gogenetic.Eswithoutcqrs = dir + "/template/go/"
		conf.Gogenetic.Eswithoutcqrsoutput = "/output/es-without-cqrs"

	}

	conf.Gogenetic.Apiname = confToml.API.Name
	conf.Gogenetic.TomlDir = *tomlFile
	conf.Gogenetic.Dir = dir

	//5. Load Template
	tmpl, err := ioutil.ReadFile(templateFile)
	checkCli(err)
	//log.Print("Parsed Template")
	//log.Print(string(tmpl))

	//6. Create Template and Pass Structs Value
	t := template.New("GRPC template")

	t1, err := t.Funcs(fnsCli).Parse(string(tmpl))
	if err != nil {
		log.Fatal("Parse: ", err)
		return
	}
	log.Println("Output:" + dir + "/" + *outDir + "/" + filelocCli(templateFile) + fileNameCli(templateFile, conf.Gogenetic.Shname))
	createDirIfNotExistCli(dir + "/" + *outDir + "/" + filelocCli(templateFile))

	f, err := os.Create(dir + "/" + *outDir + "/" + filelocCli(templateFile) + fileNameCli(templateFile, conf.Gogenetic.Shname))
	if err != nil {
		log.Println("create file: ", err)
		return
	}

	//log.Println("%v", conf.Gogenetic)
	err = t1.Execute(f, conf)
	if err != nil {
		log.Fatal("Execute: ", err)
		return
	}

	f.Close()

}