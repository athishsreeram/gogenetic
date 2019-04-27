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


How to run:
cd gogenetic/gen
go run proto_gen.go

