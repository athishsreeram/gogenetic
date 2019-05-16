package v1

import (
	"{{.API.Name}}-output/client/nats/pub"
	"{{.API.Name}}-output/proto"

	natscon "{{.API.Name}}-output/client/nats/con"

	"context"
	"encoding/json"
	"log"
	"time"

	"strings"
	"github.com/nats-io/go-nats"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}
const (
	// apiVersion is version of API is provided by server
	apiVersion = "v1"
)

var delimter string = "=@="

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
	var resp *proto.{{$e.Response}}
	nc.Subscribe(subj, func(msg *nats.Msg) {
		i += 1
		natscon.PrintMsg(msg, i)
		s := strings.Split(string(msg.Data), delimter)
		key, data := s[0], s[1]
		log.Println("%s %s", key, data)
		
			if key == "{{$e.Operationid}}d" {
{{if or (eq $e.Operationid "Create") (eq $e.Operationid "Read") (eq $e.Operationid "Update") (eq $e.Operationid "Delete") }} var dat *proto.ToDo {{end}}
{{if (eq $e.Operationid "ReadAll")  }} var dat []*proto.ToDo  {{end}}
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
		
	})

	log.Println("called out")
		log.Println(resp)
		if resp == nil {
			time.Sleep((1) * time.Second)
		}
	return resp, nil
}
{{end}}