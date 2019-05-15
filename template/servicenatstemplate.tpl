package v1

import (
	"{{.API.Name}}-output/client/nats/pub"
	"{{.API.Name}}-output/proto"
	"context"

	natscon "{{.API.Name}}-output/client/nats/con"

	"github.com/nats-io/go-nats"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}
const (
	// apiVersion is version of API is provided by server
	apiVersion = "v1"
)

var key string = "=@="

// {{(lowercase $apiname)}}Server is implementation of proto.{{$apiname}}Server proto interface
type {{(lowercase $apiname)}}Server struct {

}

// New{{$apiname}}ServiceServer creates ToDo service
func New{{$apiname}}ServiceServer() proto.{{$apiname}}ServiceServer {
	return &{{(lowercase $apiname)}}Server{}
}


{{range  $i, $e := .API.Operations}}
// Create new todo task
func (s *{{(lowercase $apiname)}}Server) {{$e.Operationid}}(ctx context.Context, req *proto.{{$e.Request}}) (*proto.{{$e.Response}}, error) {
	
	pub.Send("{{$apiname}}", "{{$e.Operationid}}", req)

	nc, _ := natscon.ConnectNATSSub(nats.DefaultURL, "")

	subj, i := "{{$apiname}}", 0

	nc.Subscribe(subj, func(msg *nats.Msg) {
		i += 1
		natscon.PrintMsg(msg, i)
	})

	{{range $k := $model}} {{if eq $e.Response .Name}}{{range .Variable}}{{if eq .Type "object"}}var {{.Name}} proto.{{titlecase .Name}}{{end}}{{if eq .Type "repeated"}}{{.Value}} := []*proto.{{removeplural (titlecase .Name)}}{}{{end}}{{end}}{{end}}{{end}}
	return &proto.{{$e.Response}}{ {{range $k := $model}} {{if eq $e.Response .Name}} {{range .Variable}}  
 					{{ (titlecase .Name)}}: {{if eq .Type "object"}}&{{end}}{{.Value}},
				{{end}}{{end}}{{end}}
	}, nil
}
{{end}}