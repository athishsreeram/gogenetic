package gogfile

import (
	"gogenetic/data"
	"log"
	"os"
	"strconv"
	"text/template"

	"io/ioutil"

	"github.com/BurntSushi/toml"
	"github.com/gobuffalo/packr"

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
	}, "convertjavatype": func(x string) string {
		if x == "int" {
			return "int"
		}
		if x == "string" {
			return "String"
		}
		if x == "repeated" {
			return "repeated"
		}
		if x == "object" {
			return "object"
		}
		if x == "boolean" {
			return "Boolean"
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
	}, "firstslash": func(x string) string {
		a := []rune(x)

		var msgStr strings.Builder
		if string(a[0:1]) == "/" {
			msgStr.WriteString(string(a[1:len(a)]))
		} else {
			return x
		}

		return msgStr.String()
	}, "tostring": func(x int) string {
		return strconv.Itoa(x)
	},
}

// AutoGenerated Create & copied from https://xuri.me/toml-to-go/
type AutoGenerated struct {
	Architechture struct {
		Name      string `toml:"Name"`
		Outputdir string `toml:"Outputdir"`
	} `toml:"Architechture"`
	API struct {
		Name       string `toml:"Name"`
		Operations []struct {
			URL             string `toml:"url"`
			Request         string `toml:"request"`
			RequestVariable []struct {
				Name      string `toml:"name"`
				Value     string `toml:"value"`
				Type      string `toml:"type"`
				Parameter string `toml:"parameter"`
				ModelVal  string `toml:"modelVal"`
			} `toml:"RequestVariable"`
			Response         string `toml:"response"`
			ResponseVariable []struct {
				Name      string `toml:"name"`
				Value     string `toml:"value"`
				Type      string `toml:"type"`
				Parameter string `toml:"parameter"`
				ModelVal  string `toml:"modelVal"`
			} `toml:"ResponseVariable"`
			Protocol    string `toml:"protocol"`
			Operationid string `toml:"operationid"`
		} `toml:"Operations"`
	} `toml:"API"`
	Models struct {
		Index string `toml:"index"`
		Model []struct {
			Name     string `toml:"name"`
			Variable []struct {
				Name      string `toml:"name"`
				Value     string `toml:"value"`
				Type      string `toml:"type"`
				Parameter string `toml:"parameter"`
				ModelVal  string `toml:"modelVal"`
			} `toml:"Variable"`
		} `toml:"Model"`
	} `toml:"Models"`
	DomainModels struct {
		DomainModel []struct {
			Name     string `toml:"name"`
			Variable []struct {
				Name   string `toml:"name"`
				Value  string `toml:"value"`
				Type   string `toml:"type"`
				Dbtype string `toml:"dbtype"`
			} `toml:"Variable"`
		} `toml:"DomainModel"`
	} `toml:"DomainModels"`
	Mapping struct {
		Map []struct {
			Name            string `toml:"name"`
			From            string `toml:"from"`
			To              string `toml:"to"`
			Type            string `toml:"type"`
			Primary         string `toml:"primary,omitempty"`
			Primarytype     string `toml:"primarytype,omitempty"`
			VariableMapping []struct {
				From string `toml:"from"`
				To   string `toml:"to"`
				Type string `toml:"type,omitempty"`
			} `toml:"VariableMapping"`
		} `toml:"Map"`
	} `toml:"Mapping"`
	CommandToEvent struct {
		Command []struct {
			Name   string `toml:"name"`
			Events []struct {
				Name string `toml:"name"`
			} `toml:"events"`
		} `toml:"Command"`
	} `toml:"CommandToEvent"`
}

var (
	file *AutoGenerated
)

// Create & copied from https://xuri.me/toml-to-go/

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func createDirIfNotExist(dir string) {
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		err = os.MkdirAll(dir, 0777)
		if err != nil {
			panic(err)
		}
	}
}

func CreateFile(cli data.AutoGeneratedCli, templateFile string, outDir string, meta string) {

	box := packr.NewBox("./template")

	//go run gogentic.go /Users/anharay/go/src/gogenetic/toml/test.toml /Users/anharay/go/src/gogenetic/template/grpctemplate.goproto
	//1. Load TOML file
	tomlData, err := ioutil.ReadFile(cli.Gogenetic.TomlDir)
	check(err)
	//log.Print("Parsed TOML")
	//log.Print(string(tomlData))

	//2. Load Template
	tmpl, err := box.FindString(templateFile)
	if err != nil {
		log.Fatal(err)
	}

	//3. Parse & Load value dynamically
	var conf AutoGenerated
	if _, err := toml.Decode(string(tomlData), &conf); err != nil {
		log.Fatal(err)
	}
	//log.Print("Parsed & Load value into Generated Structs from Create & copied from https://xuri.me/toml-to-go/")
	//log.Printf("title: %s", conf.Architechture.Name)

	//log.Print("Create a goTemplate and Pass TOML struts Value to create the final grpc file")
	//4. Create Template and Pass TOML Value
	t := template.New("GRPC template")

	t1, err := t.Funcs(fns).Parse(string(tmpl))
	if err != nil {
		log.Fatal("Parse: ", err)
		return
	}

	var dir string
	var file string

	conf.Models.Index = cli.Models.Index
	for i, operations := range conf.API.Operations {
		for _, model := range conf.Models.Model {
			if operations.Request == model.Name {
				conf.API.Operations[i].RequestVariable = model.Variable
			}
			if operations.Response == model.Name {
				conf.API.Operations[i].ResponseVariable = model.Variable
			}
		}
	}

	if cli.Gogenetic.Lang == "go" {
		dir = outDir + "/" + GoFilelocRef(templateFile)
		file = dir + GoFileNameRef(templateFile, conf.API.Name)
	}

	if cli.Gogenetic.Lang == "java" {
		dir = outDir + "/" + JavaFilelocRef(templateFile, conf.API.Name)
		file = dir + JavaFileNameRef(templateFile, conf)
	}

	if cli.Gogenetic.DbType != "" && meta == "db" {
		dir = outDir + "/" + Fileloc(templateFile)
		file = dir + FileName(templateFile, conf.API.Name)
	}

	if meta == "dockercomp" {
		dir = outDir + "/" + Fileloc(templateFile)
		file = dir + FileName(templateFile, conf.API.Name)
	}

	createDirIfNotExist(dir)

	f, err := os.Create(file)
	log.Println("Created")
	log.Println(file)

	if err != nil {
		log.Println("create file: ", err)
		return
	}

	conf.Architechture.Outputdir = outDir
	err = t1.Execute(f, conf)
	if err != nil {
		log.Fatal("Execute: ", err)
		return
	}

	f.Close()

}
