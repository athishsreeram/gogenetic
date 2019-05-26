

go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/proto-grpcresttemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/servicecrudtemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcservertemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcrestservertemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/cmdservertemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcclienttemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/xormdomaintemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/configtemplate.tpl -outDir=eventstore-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/devconftemplate.tpl -outDir=eventstore-read-output






cd /Users/anharay/go/src/gogenetic/output/eventstore-read-output

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto EventStore-service.proto


protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --grpc-gateway_out=logtostderr=true:proto EventStore-service.proto

protoc --proto_path=proto  -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --swagger_out=logtostderr=true:proto EventStore-service.proto

gofmt -w /Users/anharay/go/src/gogenetic/output/eventstore-read-output


