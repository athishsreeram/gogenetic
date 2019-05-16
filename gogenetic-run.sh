go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/proto-grpcresttemplate.tpl -outDir=test-output 
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicebasictemplate.tpl -outDir=test-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcservertemplate.tpl -outDir=test-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcrestservertemplate.tpl -outDir=test-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/cmdservertemplate.tpl -outDir=test-output 
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcclienttemplate.tpl -outDir=test-output

cd /Users/anharay/go/src/test-output

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

gofmt -w /Users/anharay/go/src/test-output