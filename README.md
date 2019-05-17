# gogenetic

Bussiness Steps
1. Create a TOML 
2. Run gogenerate sh file (YTD need to have cli will generate and run the sh file)


gogenerate 4 steps
1. Load TOML file
2. Load goTemplate
3. Parse & Load value dynamically
4. Generate a Go file with Go Template


Project Structure

    +gen - gogenetic.go file to perfrom gogenetic 4 steps
    +template - tpl file
    +toml - business entity defined in toml
    +.sh file used to run the CRUD or Event Sourcing

Build:
    go build gogenetic.go

How to run:
    
    CRUD
    ./gogenetic-crud-run.sh

    Event Sourcing
    ./gogenetic-es-with-cqrs-run.sh

    ./gogenetic-es-without-cqrs-run.sh

Output:
    
    Event Sourcing output without CQRS:
        client
            grpc
            nats
                pub
                sub
                con
        cmd
        domain
        proto
        server
            grpc
            rest
        service
        servicetodomain

    CRUD output :
        client
            grpc
        cmd
        domain
        proto
        server
            grpc
            rest
        service

    Event Sourcing output with CQRS:
        CUD:test-es-cud-output
            client
                grpc
                nats
                    pub
                    sub
                    con
            cmd
            domain
            proto
            server
                grpc
                rest
            service
            servicetodomain
         R:test-es-read-output
            client
                grpc
            cmd
            domain
            proto
            server
                grpc
                rest
            service