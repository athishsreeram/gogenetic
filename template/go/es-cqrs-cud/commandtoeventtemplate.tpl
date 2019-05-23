package servicetodomain

import (
	"{{.Architechture.Outputdir}}/client/nats/pub"
	"log"

	"github.com/Jeffail/gabs"
	cfg "{{.Architechture.Outputdir}}/config"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}{{$DomainModel := .DomainModels.DomainModel}}

func {{$apiname}}CommandToEvent(data string) {

	jsonObj, _ := gabs.ParseJSON([]byte(data))

	key, msg := jsonObj.Search("command").Data().(string), data
	log.Println("%s %s", key, msg)

	{{range  $i, $e := .CommandToEvent.Command}}
	if key == "{{$e.Name}}" {
		{{range  $j, $f := $e.Events}}
			pub.SendMsgStr(cfg.Conf.NATSSubj , "{{$f.Name}}","event", data)
		{{end}}
	}
	{{end}}
}