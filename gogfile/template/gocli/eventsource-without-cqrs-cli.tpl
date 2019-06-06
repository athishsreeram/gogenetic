./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}servicenatstemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}grpcservertemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}grpcrestservertemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}cmdservertemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}grpcclienttemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}natssubclienttemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}natspubclienttemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}servicetodomaintemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}natsconutilclienttemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}configtemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Eswithoutcqrs}}devconftemplate.tpl -outDir={{.Gogenetic.Eswithoutcqrsoutput}}


cd {{.Gogenetic.Dir}}{{.Gogenetic.Eswithoutcqrsoutput}}

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto {{.Gogenetic.Apiname}}-service.proto


protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --grpc-gateway_out=logtostderr=true:proto {{.Gogenetic.Apiname}}-service.proto

protoc --proto_path=proto  -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --swagger_out=logtostderr=true:proto {{.Gogenetic.Apiname}}-service.proto

gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Eswithoutcqrsoutput}}

mkdir -p ~/{{.Gogenetic.OutDir}}    
mv {{.Gogenetic.Dir}}{{.Gogenetic.Eswithoutcqrsoutput}}  ~/{{.Gogenetic.OutDir}}
  cd ~/{{.Gogenetic.OutDir}}
  go mod init {{firstslash .Gogenetic.OutDir}}