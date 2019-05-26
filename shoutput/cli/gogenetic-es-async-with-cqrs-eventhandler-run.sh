go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/proto-grpcresttemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormdomaintemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natssubclientehtemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natspubclienttemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/servicetodomaintemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natsconutilclienttemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/configtemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/devconftemplate.tpl -outDir=es-eventhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormesdomaintemplate.tpl -outDir=es-eventhandler-cud-output

cd /Users/anharay/go/src/gogenetic/output/es-eventhandler-cud-output

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto Test-service.proto

gofmt -w /Users/anharay/go/src/gogenetic/output/es-eventhandler-cud-output