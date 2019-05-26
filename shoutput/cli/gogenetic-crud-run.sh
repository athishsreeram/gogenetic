go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/proto-grpcresttemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/servicecrudtemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcservertemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcrestservertemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/cmdservertemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/grpcclienttemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/xormdomaintemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/configtemplate.tpl -outDir=crud
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/devconftemplate.tpl -outDir=crud

cd /Users/anharay/go/src/gogenetic/output/crud

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

  gofmt -w /Users/anharay/go/src/gogenetic/output/crud