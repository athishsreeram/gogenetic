package gogfile

import (
	"strings"
)

func LiquibaseFileloc(templateFile string) string {

	if strings.Contains(templateFile, "liquibase") {
		return ""
	}

	return ""

}

func LiquibaseFileName(templateFile string, apiName string) string {

	if strings.Contains(templateFile, "liquibase") {
		return apiName +"-liquibase-changelog.xml"
	}
	return ""

}

