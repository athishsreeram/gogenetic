package gogfile

import (
	"gogenetic/config"
	"strings"

	"github.com/spf13/viper"
)

func GoFilelocRef(templateFile string) string {
	var files config.Files
	viper.Unmarshal(&files)

	for _, files := range files.FileLoc {
		if strings.Contains(templateFile, files.Key) {
			return files.FileLoc
		}
	}
	return ""
}

func GoFileNameRef(templateFile string, apiName string) string {
	var files config.Files

	viper.Unmarshal(&files)
	for _, files := range files.FileLoc {
		if strings.Contains(templateFile, files.Key) {
			return apiName + files.FileName
		}
	}
	return ""

}
