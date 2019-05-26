


go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/proto-grpcresttemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/serviceasyncnatstemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcservertemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcrestservertemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/cmdservertemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcclienttemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormdomaintemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natssubclienttemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natspubclienttemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/servicetodomaintemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natsconutilclienttemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/configtemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/devconftemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/commandtoeventtemplate.tpl -outDir=es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormesdomaintemplate.tpl -outDir=es-cud-output







cd /Users/anharay/go/src/gogenetic/output/es-cud-output

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

gofmt -w /Users/anharay/go/src/gogenetic/output/es-cud-output
