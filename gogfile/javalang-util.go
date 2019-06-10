package gogfile

import (
	"strings"
)

func javaFileloc(templateFile string) string {
	if strings.Contains(templateFile, "pom") {
		return "/"
	}

	return ""
}

func javaFileName(templateFile string, apiName string) string {
	if strings.Contains(templateFile, "pom") {
		return "pom.xml"
	}
	return ""
}
