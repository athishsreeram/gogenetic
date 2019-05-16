package grpc

import (
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/proto"
	v1 "{{.API.Name}}-{{.Architechture.Name}}-read-output/service/v1"
	"context"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func RunServer(ctx context.Context, port string) {
	listener, err := net.Listen("tcp", ":"+port)
	if err != nil {
		panic(err)
	}

	srv := grpc.NewServer()
	v1API := v1.New{{.API.Name}}ServiceServer()

	proto.Register{{.API.Name}}ServiceServer(srv, v1API)
	reflection.Register(srv)

	if e := srv.Serve(listener); e != nil {
		panic(e)
	}

}