package v1

import (
	"{{.Architechture.Outputdir}}/client/nats/pub"
	"{{.Architechture.Outputdir}}/proto"

	cfg "{{.Architechture.Outputdir}}/config"
	guuid "github.com/google/uuid"
	
	"context"
	"log"

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
	uuid := guuid.New().String()
	pub.Send(cfg.Conf.NATSSubj, "{{$apiname}}{{$e.Operationid}}dCommand", "command", req, uuid)

	var resp *proto.{{$e.Response}}
	
	resp = &proto.{{$e.Response}}{ {{range $k := $model}} {{if eq $e.Response .Name}} {{range .Variable}}  
						{{ (titlecase .Name)}}: {{if  or (eq .Type "object") (eq .Type "repeated") }}dat{{end}}{{if and (ne .Type "object") (ne .Type "repeated")}}{{.Value}}{{end}},
					{{end}}{{end}}{{end}}
			}

	log.Println("called out")
	log.Println(resp)
	for resp == nil {
	} 
	return resp, nil
}
{{end}}
{{end}}