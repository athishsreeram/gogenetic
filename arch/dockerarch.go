package arch

import (
	"gogenetic/config"
	"gogenetic/gogexec"
	"gogenetic/gogfile"

	"gogenetic/data"

	"github.com/spf13/viper"
)

func DockerLangArchConf(conf data.AutoGeneratedCli, confType string) {

	var userTomlDir = conf.Gogenetic.TomlDir
	var userAPIName = conf.API.Name
	var archTypes config.ArchTypes

	viper.Unmarshal(&archTypes)

	gogexec.MoveTo(conf.Gogenetic.Dir)

	for _, arch := range archTypes.ArchType {
		if confType == arch.Name {
			for _, archPgt := range arch.Projects {
				for _, project := range archTypes.Projects {
					if archPgt == project.Name {

						if project.TemplateToml == "" {
							conf.Gogenetic.TomlDir = userTomlDir
						} else {
							conf.Gogenetic.TomlDir = project.TemplateToml
						}

						if project.ApiName == "" {
							conf.API.Name = userAPIName
						} else {
							conf.API.Name = project.ApiName
						}

						for _, projectTpl := range project.Templates {
							gogfile.CreateFile(conf, project.TemplateBasePath+projectTpl, conf.Gogenetic.OutDir+project.OutputDir, "dockercomp")
						}

					}

				}
			}

		}

	}

}
