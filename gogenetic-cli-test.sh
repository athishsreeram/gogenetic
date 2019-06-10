./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es.toml -archType=es-sync-with-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-with-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-rest.toml -archType=es-async-with-cqrs-read

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/eventstore-read.toml -archType=es-cqrs-eventstore-read

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-cqrs-cmd-event-handler-cud

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-ch.toml -archType=es-async-cmdhandler-with-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-eh.toml -archType=es-async-eventhandler-with-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo.toml -archType=crud

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo.toml -archType=es-without-cqrs

chmod 777 ./output/cli/*.sh