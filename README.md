# gogenetic

Bussiness Steps
1. Create a TOML 
2. Run gogenerate


gogenerate steps
1. Load TOML file
2. Load goTemplate
3. Parse & Load value dynamically
3. Generate a Go file with Go Template

Note:
Need to figure out a way to create the structs dynamically from 

Project Structure
    +gen - file to perfrom above 4 steps
    +template 
    +toml

Build

go build gogenetic.go


How to run:
cd gogenetic/gen

1.Go run

Runs with default value
    go run gogentic.go 
    or
    go run gogentic.go -tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcresttemplate.goproto

or 

2. CLI
    Runs with default value
    gogenetic 
        or 
    gogentic-tomlFile=/Users/anharay/go/src/gogenetic/toml/test.toml -templateFile=/Users/anharay/go/src/gogenetic/template/grpcresttemplate.goproto