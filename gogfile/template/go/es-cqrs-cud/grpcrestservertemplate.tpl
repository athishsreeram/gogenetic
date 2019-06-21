package rest

import (
	"context"
	"net/http"

	"google.golang.org/grpc"

	"github.com/grpc-ecosystem/grpc-gateway/runtime"
	"github.com/prometheus/client_golang/prometheus/promhttp"

	gw "{{.Architechture.Outputdir}}/proto"
)

func RunServer(ctx context.Context, grpcport string, httpport string) error {
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	runtimeMux := runtime.NewServeMux()

	httpMux := http.NewServeMux()
	httpMux.Handle("/", runtimeMux)
	httpMux.Handle("/metrics", promhttp.Handler())
	prefix := "/docs/"
	fileServer := http.FileServer(http.Dir("./proto/dist/"))
	httpMux.Handle(prefix, http.StripPrefix(prefix, fileServer))

	opts := []grpc.DialOption{grpc.WithInsecure()}
	err := gw.Register{{.API.Name}}ServiceHandlerFromEndpoint(ctx, runtimeMux, "localhost:"+grpcport, opts)
	if err != nil {
		return err
	}

	return http.ListenAndServe(":"+httpport, httpMux)
}