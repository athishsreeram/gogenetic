package v1

import (
	"{{.API.Name}}-{{.Architechture.Name}}-cud-output/client/nats/pub"
	"{{.API.Name}}-{{.Architechture.Name}}-cud-output/proto"

	natscon "{{.API.Name}}-{{.Architechture.Name}}-cud-output/client/nats/con"
	cfg "{{.API.Name}}-{{.Architechture.Name}}-cud-output/config"
	guuid "github.com/google/uuid"
	
	"context"
	"encoding/json"
	"log"

	"github.com/nats-io/go-nats"
	"github.com/Jeffail/gabs"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}} {{$DomainModel := .DomainModels.DomainModel}} {{$MappingMap := .Mapping.Map}}
const (
	// apiVersion is version of API is provided by server
	apiVersion = "v1"
)

// {{(lowercase $apiname)}}Server is implementation of proto.{{$apiname}}Server proto interface
type {{(lowercase $apiname)}}Server struct {

}

// New{{$apiname}}ServiceServer creates {$apiname}} service
func New{{$apiname}}ServiceServer() proto.{{$apiname}}ServiceServer {
	return &{{(lowercase $apiname)}}Server{}
}


{{range  $i, $e := .API.Operations}}
{{ if or (eq $e.Operationid "Create") (eq $e.Operationid "Update") (eq $e.Operationid "Delete") }}
// Create new todo task
func (s *{{(lowercase $apiname)}}Server) {{$e.Operationid}}(ctx context.Context, req *proto.{{$e.Request}}) (*proto.{{$e.Response}}, error) {
	
	pub.Send(cfg.Conf.NATSSubj, "{{$apiname}}{{$e.Operationid}}Command", "command", req, guuid.New().String())

	nc, _ := natscon.ConnectNATSSub(cfg.Conf.NATSurl, "")

	subj, i := "{{$apiname}}", 0
	var resp *proto.{{$e.Response}}
	nc.Subscribe(subj, func(msg *nats.Msg) {
		i += 1
		natscon.PrintMsg(msg, i)

	 	jsonObj, _ := gabs.ParseJSON(msg.Data)

		if jsonObj.ExistsP("event") == true {

			key,data := jsonObj.Search("event").Data().(string),msg.Data
			log.Println("%s %s", key, data)
				
				
				{{range  $j, $f := $MappingMap}}	{{if eq  $f.Type "domain2dto"}} {{range  $k, $g := $DomainModel}}{{if eq  $f.From $g.Name}} 
				if key == "{{$g.Name}}Event{{$e.Operationid}}Completed" {
				var dat {{if ne  $e.Operationid "Delete"}} {{if eq  $e.Operationid "ReadAll"}}[]{{end}}*proto.{{$f.To}} {{end}} {{if eq  $e.Operationid "Delete"}} bool {{end}}
				{{end}}{{end}}{{end}}{{end}}
					err := json.Unmarshal([]byte(data), &dat)
					if err != nil {
						log.Println(err)
					}
					resp = &proto.{{$e.Response}}{ {{range $k := $model}} {{if eq $e.Response .Name}} {{range .Variable}}  
						{{ (titlecase .Name)}}: {{if  or (eq .Type "object") (eq .Type "repeated") }}dat{{end}}{{if and (ne .Type "object") (ne .Type "repeated")}}{{.Value}}{{end}},
					{{end}}{{end}}{{end}}
					}
					log.Println("called in")
					log.Println(resp)
				}
			}
	})

	log.Println("called out")
	log.Println(resp)
	for resp == nil {
	} 
	return resp, nil
}
{{end}}
{{end}}