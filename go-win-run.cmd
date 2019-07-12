set GOPATH=D:\go-work
set GOROOT=E:\Software\go1.12.6.windows-386\go
set PATH=%PATH%;%GOPATH%\bin;%GOROOT%\bin;E:\Software\protoc-3.8.0-win32\bin

gog.exe -tomlFile=D:\workspaces\gogenetic\toml\todo.toml -archType=crud -lang=java -outDir=output1

gog.exe -tomlFile=D:\workspaces\gogenetic\toml\todo.toml -archType=crud -lang=go -outDir=output1