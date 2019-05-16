package v1

import (
	"context"
	"{{.API.Name}}-{{.Architechture.Name}}-output/proto"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}
const (
	// apiVersion is version of API is provided by server
	apiVersion = "v1"
)



// {{(lowercase $apiname)}}Server is implementation of proto.{{$apiname}}Server proto interface
type {{(lowercase $apiname)}}Server struct {

}

// New{{$apiname}}ServiceServer creates {{$apiname}} service
func New{{$apiname}}ServiceServer() proto.{{$apiname}}ServiceServer {
	return &{{(lowercase $apiname)}}Server{}
}


{{range  $i, $e := .API.Operations}}
// Create new todo task
func (s *{{(lowercase $apiname)}}Server) {{$e.Operationid}}(ctx context.Context, req *proto.{{$e.Request}}) (*proto.{{$e.Response}}, error) {
	// TO-DO
	{{range $k := $model}} {{if eq $e.Response .Name}}{{range .Variable}}{{if eq .Type "object"}}var {{.Name}} proto.{{titlecase .Name}}{{end}}{{if eq .Type "repeated"}}{{.Value}} := []*proto.{{removeplural (titlecase .Name)}}{}{{end}}{{end}}{{end}}{{end}}
	return &proto.{{$e.Response}}{ {{range $k := $model}} {{if eq $e.Response .Name}} {{range .Variable}}  
 					{{ (titlecase .Name)}}: {{if eq .Type "object"}}&{{end}}{{.Value}},
				{{end}}{{end}}{{end}}
	}, nil
}
{{end}}