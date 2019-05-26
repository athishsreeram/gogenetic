go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es.toml -archType=es-cqrs

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -archType=es-async-cqrs

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-rest.toml -archType=es-async-cqrs-read

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/eventstore-read.toml -archType=es-cqrs-eventstore-read

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async.toml -archType=es-async-cqrs-cmd-event-handler-cud

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-ch.toml -archType=es-async-cmdhandler-cqrs

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo-es-async-eh.toml -archType=es-async-eventhandler-cqrs

go run  ./gen/gogenticcli.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/todo.toml -archType=crud