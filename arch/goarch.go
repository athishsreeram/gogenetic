package arch

import (
	"gogenetic/config"
	"gogenetic/gogexec"
	"gogenetic/gogfile"
	"os"

	"gogenetic/data"

	"github.com/spf13/viper"
)

func GoLangArch(conf data.AutoGeneratedCli, archType string) {

	GoLangArchConf(conf, archType)

}

func runGRPC(conf data.AutoGeneratedCli, dir string) {
	grpcargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--go_out=plugins=grpc:proto", conf.API.Name + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcargs)

	grpcgatewayargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--grpc-gateway_out=logtostderr=true:proto", conf.API.Name + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcgatewayargs)

	runSwagger(conf, "proto", dir)

}

func runSwagger(conf data.AutoGeneratedCli, protoDir string, outputDir string) {
	dist := protoDir + "/dist"
	gogexec.CreateDirIfNotExist(dist)
	grpcswaggerargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--swagger_out=logtostderr=true:" + dist, conf.API.Name + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcswaggerargs)
	gogexec.SwaggerTemplate(outputDir+"/"+dist, conf.API.Name+"-service.swagger.json")
}

func runSwaggerJava(conf data.AutoGeneratedCli, protoDir string, outputDir string) {
	dist := protoDir
	gogexec.CreateDirIfNotExist(dist)
	grpcswaggerargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--swagger_out=logtostderr=true:" + dist, conf.API.Name + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcswaggerargs)
}

func formatCode(dir string) {
	gofmtargs := []string{"-w", dir}
	gogexec.ExecuteCmd("gofmt", gofmtargs)
}

func applyGoMod(dir string) {
	gomodargs := []string{"mod", "init", dir}
	gogexec.ExecuteCmd("go", gomodargs)
}

func GoLangArchConf(conf data.AutoGeneratedCli, archType string) {

	var userTomlDir = conf.Gogenetic.TomlDir
	var userApiName = conf.API.Name
	var archTypes config.ArchTypes

	viper.Unmarshal(&archTypes)

	for _, arch := range archTypes.ArchType {
		if archType == arch.Name {
			for _, archPgt := range arch.Projects {
				for _, project := range archTypes.Projects {
					if archPgt == project.Name {

						if project.TemplateToml == "" {
							conf.Gogenetic.TomlDir = userTomlDir
						} else {
							conf.Gogenetic.TomlDir = project.TemplateToml
						}

						if project.ApiName == "" {
							conf.API.Name = userApiName
						} else {
							conf.API.Name = project.ApiName
						}

						for _, projectTpl := range project.Templates {
							gogfile.CreateFile(conf, project.TemplateBasePath+projectTpl, conf.Gogenetic.OutDir+project.OutputDir)
						}

						if project.Grpc == "true" {
							gogexec.MoveTo(conf.Gogenetic.OutDir + project.OutputDir)

							runGRPC(conf, conf.Gogenetic.Dir+"/"+conf.Gogenetic.OutDir+"/"+project.OutputDir)

							formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.OutDir + "/" + project.OutputDir)

							gogexec.MoveTo("../..")
						}
					}

				}
			}

			gogexec.MoveTo(conf.Gogenetic.Dir + "/" + conf.Gogenetic.OutDir)
			applyGoMod(conf.Gogenetic.OutDir)

		}

	}

}
