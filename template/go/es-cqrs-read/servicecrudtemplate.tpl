package v1

import (
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/proto"
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/domain"
	"context"
	"log"
	"strconv"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}} {{$DomainModel := .DomainModels.DomainModel}} {{$MappingMap := .Mapping.Map}}
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
{{ if or (eq $e.Operationid "Read") (eq $e.Operationid "ReadAll")}}
// Create new todo task
func (s *{{(lowercase $apiname)}}Server) {{$e.Operationid}}(ctx context.Context, req *proto.{{$e.Request}}) (*proto.{{$e.Response}}, error) {
	// TO-DO
		{{ if (eq $e.Operationid "Read") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			var {{firstsmall $e.To}} *proto.{{$e.To}}
			n, err := strconv.Atoi(strconv.FormatInt(req.Id, 10))
			if err == nil {
				{{firstsmall $e.To}} = domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}(n))
			}
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "ReadAll") }}
				{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
				var {{firstsmall $e.To}}s []*proto.{{$e.To}}
				for _, {{firstsmall $e.From}} := range domain.ReadAll{{titlecase $e.From}}() {
					{{firstsmall $e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.Sno))
					{{firstsmall $e.To}}s = append({{firstsmall $e.To}}s, {{firstsmall $e.To}})
				}
				{{end}}{{end}}{{end}}{{end}}
		{{end}}
	
	{{range $k := $model}} {{if eq $e.Response .Name}}{{range .Variable}}{{if eq .Type "repeated"}}{{.Value}} := []*proto.{{removeplural (titlecase .Name)}}{}{{end}}{{end}}{{end}}{{end}}
	resp := &proto.{{$e.Response}}{ {{range $k := $model}} {{if eq $e.Response .Name}} {{range .Variable}}  
 					{{ (titlecase .Name)}}: {{if eq .Type "object"}}{{end}}{{.Value}},
				{{end}}{{end}}{{end}}
	}
	log.Println(resp)
	return resp, nil
}
{{end}}
{{end}}