go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/proto-grpcresttemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicenatstemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcservertemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcrestservertemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/cmdservertemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcclienttemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/domaintemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/natssubclienttemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/natspubclienttemplate.tpl
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test-crud.toml -templateFile=/Users/anharay/go/src/gogenetic/template/servicetodomaintemplate.tpl


cd /Users/anharay/go/src/Test-output

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