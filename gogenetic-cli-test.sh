./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es.toml -archType=es-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-rest.toml -archType=es-async-cqrs-read

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/eventstore-read.toml -archType=es-cqrs-eventstore-read

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async.toml -archType=es-async-cqrs-cmd-event-handler-cud

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-ch.toml -archType=es-async-cmdhandler-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo-es-async-eh.toml -archType=es-async-eventhandler-cqrs

./gogenetic-cli/gogenetic-cli -tomlFile=$(pwd)/toml/todo.toml -archType=crud