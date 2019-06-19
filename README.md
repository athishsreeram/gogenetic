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
        archType=crud
        archType=es-sync-with-cqrs
        archType=es-sync-without-cqrs
        archType=es-async-with-cqrs
        archType=es-async-with-cqrs-read
        archType=es-async-cmdhandler-with-cqrs
        archType=es-async-eventhandler-with-cqrs
        archType=es-cqrs-eventstore-read
    3. File Output
        archType=file

## Architechture Supported

    1. Java
        lang=java
    2. Go
        lang=go

# Run Gogenetic

    ./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=crud -lang=java

    ./gog -outDir=output -tomlFile=$(pwd)/toml/todo.toml -archType=file -templateFile=$(pwd)/anytemplate.tpl -lang=go

## Parameter Supported

    1. outDir  - location where the your output should be created
    2. tomlFiles - the business entity as per business toml structure
    3. archType - technical archtiture supported
    4. templateFile - need when archType is file you can pass your custom template to generate as per you need
    5. lang - languages supported

# Platform Setup

## Windows

    set GOROOT=E:\Software\go1.12.6.windows-386\go
    set GOPATH=D:\go-work
    set PATH=%PATH%;%GOPATH%\bin;%GOROOT%\bin;E:\Software\protoc-3.8.0-win32\bin