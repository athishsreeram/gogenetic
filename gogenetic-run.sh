go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/swaggertemplate.goproto
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/proto-grpcresttemplate.goproto 
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicetemplate.goproto
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcservertemplate.goproto
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/cmdservertemplate.goproto 
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/clienttemplate.goproto

cd /Users/anharay/go/src/output

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