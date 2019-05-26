go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natssubclientchtemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natspubclienttemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/natsconutilclienttemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/configtemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/devconftemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/xormesdomaintemplate.tpl -outDir=es-cmdhandler-cud-output
go run ./gen/gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -templateFile=/Users/anharay/go/src/gogenetic/template/go/es-cqrs-cud/commandtoeventtemplate.tpl -outDir=es-cmdhandler-cud-output


gofmt -w /Users/anharay/go/src/gogenetic/output/es-cmdhandler-cud-output