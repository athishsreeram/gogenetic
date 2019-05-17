package main

import (
	"context"
	"flag"
	"log"
	"time"

	"google.golang.org/grpc"

	v1 "{{.API.Name}}-{{.Architechture.Name}}-cud-output/proto"
)

{{$apiname := .API.Name}} {{$model := .Models.Model}}
func main() {
	// Get configuration
	address := flag.String("server", "localhost:4040", "gRPC server in format host:port")
	flag.Parse()

	// Set up a connection to the server.
	conn, err := grpc.Dial(*address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()

	c := v1.New{{$apiname}}ServiceClient(conn)

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	
	{{range  $i, $e := .API.Operations}}
	// Call {{.Operationid}}
    {{range $k := $model}} {{if eq $e.Request .Name}}{{range .Variable}}{{if eq .Type "object"}}var {{.Name}}{{$i}} v1.{{titlecase .Name}}{{end}}{{if eq .Type "repeated"}}{{.Value}} := []*proto.{{removeplural (titlecase .Name)}}{}{{end}}{{end}}{{end}}{{end}}
	req{{$i}} := v1.{{$e.Request}}{
		{{range $k := $model}} {{if eq $e.Request .Name}} {{range .Variable}}  
 					{{titlecase .Name}}:  {{if eq .Type "object"}}&{{end}}{{.Value}}{{if eq .Type "object"}}{{$i}}{{end}}, {{end}}{{end}}{{end}}
	}
	res{{$i}}, err := c.{{$e.Operationid}}(ctx, &req{{$i}})
	if err != nil {
		log.Fatalf("Call {{.Operationid}} failed: %v", err)
	}
	log.Printf("Call {{.Operationid}} result: <%+v>\n\n", res{{$i}})
	{{end}}
		
}