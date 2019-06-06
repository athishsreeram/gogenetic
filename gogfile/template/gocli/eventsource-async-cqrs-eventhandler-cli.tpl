./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}proto-grpcresttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormdomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natssubclientehtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natspubclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}servicetodomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natsconutilclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}configtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}devconftemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormesdomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormcommandstoredomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}

cd {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}

ls

protoc --proto_path=proto -I/usr/local/include -I. \
  -I$GOPATH/src \
  -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  --go_out=plugins=grpc:proto {{.Gogenetic.Apiname}}-service.proto

gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}

mkdir -p ~/{{.Gogenetic.OutDir}}    
mv {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}  ~/{{.Gogenetic.OutDir}}
  cd ~/{{.Gogenetic.OutDir}}
  go mod init {{firstslash .Gogenetic.OutDir}}