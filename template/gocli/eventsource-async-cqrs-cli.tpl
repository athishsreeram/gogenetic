{{if eq .Gogenetic.Read "True"}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}servicecrudtemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}grpcservertemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}grpcrestservertemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}cmdservertemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}grpcclienttemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}configtemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrsread}}devconftemplate.tpl -outDir={{.Gogenetic.Esreadoutput}}
{{end}}
{{if eq .Gogenetic.Eventsource "True"}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}servicecrudtemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}grpcservertemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}grpcrestservertemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}cmdservertemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}grpcclienttemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}configtemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
./gogenetic -tomlFile={{.Gogenetic.Tomlesread}} -templateFile={{.Gogenetic.Escqrsread}}devconftemplate.tpl -outDir={{.Gogenetic.Eventstorereadoutput}}
{{end}}
{{if eq .Gogenetic.Cud "True"}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}serviceasyncnatstemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}grpcservertemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}grpcrestservertemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}cmdservertemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}grpcclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natssubclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natspubclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}servicetodomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natsconutilclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}configtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}devconftemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}commandtoeventtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormesdomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
{{end}}

{{if eq .Gogenetic.Read "True"}}
cd {{.Gogenetic.Dir}}{{.Gogenetic.Esreadoutput}}

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

gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Esreadoutput}}
{{end}}

{{if eq .Gogenetic.Eventsource "True"}}
cd {{.Gogenetic.Dir}}{{.Gogenetic.Eventstorereadoutput}}

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

gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Eventstorereadoutput}}
{{end}}

{{if eq .Gogenetic.Cud "True"}}
cd {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}

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

gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}
{{end}}