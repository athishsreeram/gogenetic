go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/proto-grpcresttemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicenatstemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcservertemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcrestservertemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/cmdservertemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcclienttemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/xormdomaintemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/natssubclienttemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/natspubclienttemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicetodomaintemplate.tpl -outDir=test-output-es
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/natsconutilclienttemplate.tpl -outDir=test-output-es


cd /Users/anharay/go/src/test-output-es

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

gofmt -w /Users/anharay/go/src/test-output-es