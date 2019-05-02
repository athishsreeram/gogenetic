# gogenetic

Bussiness Steps
1. Create a TOML 
2. Run gogenerate sh file


gogenerate steps
1. Load TOML file
2. Load goTemplate
3. Parse & Load value dynamically
3. Generate a Go file with Go Template


Project Structure

    +gen - file to perfrom above 4 steps

    +template 

    +toml

gogenetic available for please refer toml folder:

    grpc
    grpcrest
    swagger
    client
    server
    service


Build

go build gogenetic.go


How to run:

./gogenetic-run.sh

Code Generated Output:

