package gogfile

import (
	"gogenetic/config"
	"strconv"
	"strings"

	"github.com/spf13/viper"
)

func JavaFilelocRef(templateFile string, apiName string) string {
	var files config.Files
	viper.Unmarshal(&files)

	for _, files := range files.FileLoc {
		if strings.Contains(templateFile, files.Key) {

			if strings.Contains(files.AddModelName, "true") {
				return files.FileLoc + strings.ToLower(apiName) + "/model/"
			}
			if strings.Contains(files.AddApiName, "true") {
				return files.FileLoc + strings.ToLower(apiName) + "/"
			}
			if strings.Contains(files.AddApiName, "true") {
				return files.FileLoc + strings.ToLower(apiName) + "/"
			}
			if files.FileLoc != "" {
				return files.FileLoc
			}

		}

	}
	return ""
}

func JavaFileNameRef(templateFile string, conf AutoGenerated) string {
	var files config.Files

	viper.Unmarshal(&files)
	for _, files := range files.FileLoc {
		if strings.Contains(templateFile, files.Key) {
			if strings.Contains(files.AddApiName, "true") {
				return conf.API.Name + files.FileName
			}
			if strings.Contains(files.AddModelName, "true") {
				i2, err := strconv.Atoi(conf.Models.Index)
				if err != nil {
					panic(err)
				}
				return conf.Models.Model[i2].Name + files.FileName
			}
			if strings.Contains(files.AddDomainModelName, "true") {
				return conf.DomainModels.DomainModel[0].Name + files.FileName
			}
			return files.FileName
		}
	}
	return ""

}
