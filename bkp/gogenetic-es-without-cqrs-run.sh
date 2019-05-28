go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/proto-grpcresttemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/servicenatstemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcservertemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcrestservertemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/cmdservertemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcclienttemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/xormdomaintemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/natssubclienttemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/natspubclienttemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/servicetodomaintemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/natsconutilclienttemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/configtemplate.tpl -outDir=test-es-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/devconftemplate.tpl -outDir=test-es-output


cd /Users/anharay/go/src/test-es-output

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

gofmt -w /Users/anharay/go/src/test-es-output