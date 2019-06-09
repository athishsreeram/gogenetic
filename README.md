# gogenetic

A Go micro services eco-system, designed to make development and maintaince of microservice life easier.

# Goal
To make application development or maintenance language, platform, architechutre, deployment and runtime agnostic.

Gogenetic helps you to generate a micro service project that already has everything from as per the back-end architechture (database, routing, etc.) already hooked up and ready to run. From there it provides easy APIs to build your microservice in different application architechture style in Go.

Gogenetic isn't just a framework; it's a holistic focused on business environment and translate into business entity into technical platform that is needed for the based on the technical architechture they decide it gives the developer the project structure that lets get straight how the business is coupled with technology and solutioning together to arrive at their Online Business.


# Build Gogenetic
    go build gog.go

    cd gogenetic-cli
    go build gogenetic-cli.go

# How Gogenetic works

    1. Load TOML file
    2. Load goTemplate
    3. Parse & Load value dynamically
    4. Generate a Go file with Go Template
 
## Business TOML Structure

It where you define you business entity from where you can clearly define business a tech doc which business/developer can create and can we reviewed together

    1.API
    2.Models
    3.DomainModels
    4.Mapping

## Architechture Supported

    1. CRUD
        archType=crud
    2. Event Source
        archType=es-with-cqrs
        archType=es-async-with-cqrs
        archType=es-async-with-cqrs-read
        archType=es-cqrs-eventstore-read
        archType=es-async-with-cqrs-cmd-event-handler-cud
        archType=es-async-cmdhandler-with-cqrs
        archType=es-async-eventhandler-with-cqrs
        archType=crud
        archType=es-without-cqrs
        archType=file


# Run Gogenetic

    ./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=crud

    ./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=file -templateFile=$(pwd)/anytemplate.tpl

## Parameter Supported

    1. outDir location where the your output should be created
    2. tomlFiles the business entity as per business toml structure
    3. archType technical archtiture supported
    4. templateFile need when archType is file you can pass your custom template to generate as per you need