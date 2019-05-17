go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/proto-grpcresttemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/servicecrudtemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcservertemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcrestservertemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/cmdservertemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/grpcclienttemplate.tpl -outDir=test-es-read-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-read/xormdomaintemplate.tpl -outDir=test-es-read-output


go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/proto-grpcresttemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/servicenatstemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcservertemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcrestservertemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/cmdservertemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/grpcclienttemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormdomaintemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natssubclienttemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natspubclienttemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/servicetodomaintemplate.tpl -outDir=test-es-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natsconutilclienttemplate.tpl -outDir=test-es-cud-output

cd /Users/anharay/go/src/test-es-read-output

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

gofmt -w /Users/anharay/go/src/test-es-read-output


cd /Users/anharay/go/src/test-es-cud-output

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

gofmt -w /Users/anharay/go/src/test-es-cud-output