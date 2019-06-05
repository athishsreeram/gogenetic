./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natssubclientchtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natspubclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}natsconutilclienttemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}configtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}devconftemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormesdomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}commandtoeventtemplate.tpl -outDir={{.Gogenetic.Cudoutput}}
./gogenetic -tomlFile={{.Gogenetic.TomlDir}} -templateFile={{.Gogenetic.Escqrscud}}xormcommandstoredomaintemplate.tpl -outDir={{.Gogenetic.Cudoutput}}


gofmt -w {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}

ls

mkdir -p ~/{{.Gogenetic.OutDir}}    
mv {{.Gogenetic.Dir}}{{.Gogenetic.Cudoutput}}  ~/{{.Gogenetic.OutDir}}
  cd ~/{{.Gogenetic.OutDir}}
  go mod init {{firstslash .Gogenetic.OutDir}}