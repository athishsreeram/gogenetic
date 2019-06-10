./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es.toml -archType=es-sync-with-cqrs

./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-with-cqrs

./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es-async-rest.toml -archType=es-async-with-cqrs-read

./gog -outDir=output -tomlFile=$(pwd)/toml/eventstore-read.toml -archType=es-cqrs-eventstore-read

./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-cqrs-cmd-event-handler-cud

./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es-async-ch.toml -archType=es-async-cmdhandler-with-cqrs

./gog -outDir=output -tomlFile=$(pwd)/toml/todo-es-async-eh.toml -archType=es-async-eventhandler-with-cqrs

./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=crud

./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=es-without-cqrs
