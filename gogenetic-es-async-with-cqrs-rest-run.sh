go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/proto-grpcresttemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/serviceasyncnatstemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcservertemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcrestservertemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/cmdservertemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcclienttemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natspubclienttemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natsconutilclienttemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/configtemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/devconftemplate.tpl -outDir=test-es-rest-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormesdomaintemplate.tpl -outDir=test-es-rest-cud-output


cd /Users/anharay/go/src/test-es-rest-cud-output

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

gofmt -w /Users/anharay/go/src/test-es-rest-cud-output