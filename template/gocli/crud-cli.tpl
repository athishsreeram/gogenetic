go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}servicecrudtemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}grpcservertemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}grpcrestservertemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}cmdservertemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}grpcclienttemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}configtemplate.tpl -outDir={{.Gogenetic.Crudoutput}}
go run ./gen/gogentic.go -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Crud}}devconftemplate.tpl -outDir={{.Gogenetic.Crudoutput}}

cd {{.Gogenetic.Dir}}{{.Gogenetic.Crudoutput}}

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto {{.Gogenetic.Apiname}}-service.proto


protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --grpc-gateway_out=logtostderr=true:proto {{.Gogenetic.Apiname}}-service.proto

protoc --proto_path=proto  -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --swagger_out=logtostderr=true:proto {{.Gogenetic.Apiname}}-service.proto

  gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Crudoutput}}