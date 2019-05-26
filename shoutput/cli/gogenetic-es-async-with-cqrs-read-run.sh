
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/proto-grpcresttemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/servicecrudtemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcservertemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcrestservertemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/cmdservertemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcclienttemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/xormdomaintemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/configtemplate.tpl -outDir=es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/devconftemplate.tpl -outDir=es-read-output





cd /Users/anharay/go/src/gogenetic/output/es-read-output

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto Test-service.proto


protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --grpc-gateway_out=logtostderr=true:proto Test-service.proto

protoc --proto_path=proto  -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --swagger_out=logtostderr=true:proto Test-service.proto

gofmt -w /Users/anharay/go/src/gogenetic/output/es-read-output




