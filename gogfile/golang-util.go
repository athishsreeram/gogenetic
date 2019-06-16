package gogfile

import (
	"strings"
)

func GoFileloc(templateFile string) string {
	if strings.Contains(templateFile, "proto-") {
		return "proto/"
	}
	if strings.Contains(templateFile, "cmd") {
		return "cmd/main/"
	}
	if strings.Contains(templateFile, "grpcserver") {
		return "server/grpc/"
	}
	if strings.Contains(templateFile, "grpcrestserver") {
		return "server/rest/"
	}
	if strings.Contains(templateFile, "servicetodomain") {
		return "servicetodomain/"
	}
	if strings.Contains(templateFile, "service") {
		return "service/v1/"
	}
	if strings.Contains(templateFile, "grpcclient") {
		return "client/grpc/v1/"
	}
	if strings.Contains(templateFile, "domain") {
		return "domain/"
	}
	if strings.Contains(templateFile, "natspubclient") {
		return "client/nats/pub/"
	}
	if strings.Contains(templateFile, "natssubclient") {
		return "client/nats/sub/"
	}
	if strings.Contains(templateFile, "natsconutilclient") {
		return "client/nats/con/"
	}
	if strings.Contains(templateFile, "config") {
		return "config/"
	}
	if strings.Contains(templateFile, "commandtoevent") {
		return "servicetodomain/"
	}
	if strings.Contains(templateFile, "readme") {
		return ""
	}

	return ""

}

func GoFileName(templateFile string, apiName string) string {

	if strings.Contains(templateFile, "proto-") {
		return apiName + "-service.proto"
	}
	if strings.Contains(templateFile, "cmd") {
		return apiName + "-cmdserver.go"
	}
	if strings.Contains(templateFile, "grpcserver") {
		return apiName + "-server.go"
	}
	if strings.Contains(templateFile, "grpcrestserver") {
		return apiName + "-rest-server.go"
	}
	if strings.Contains(templateFile, "swagger") {
		return apiName + "-swagger.yml"
	}
	if strings.Contains(templateFile, "servicetodomain") {
		return apiName + "-EventHandler.go"
	}
	if strings.Contains(templateFile, "servicebasic") {
		return apiName + "-service.go"
	}
	if strings.Contains(templateFile, "servicenats") {
		return apiName + "-nat-service.go"
	}
	if strings.Contains(templateFile, "serviceasyncnats") {
		return apiName + "-nat-service.go"
	}
	if strings.Contains(templateFile, "servicecrud") {
		return apiName + "-crud-service.go"
	}
	if strings.Contains(templateFile, "grpcclient") {
		return apiName + "-client.go"
	}
	if strings.Contains(templateFile, "commandstoredomain") {
		return apiName + "-cmdsdomain.go"
	}
	if strings.Contains(templateFile, "esdomain") {
		return apiName + "-esdomain.go"
	}
	if strings.Contains(templateFile, "domain") {
		return apiName + "-domain.go"
	}
	if strings.Contains(templateFile, "natspubclient") {
		return apiName + "-pub-client.go"
	}
	if strings.Contains(templateFile, "natssubclient") {
		return apiName + "-sub-client.go"
	}
	if strings.Contains(templateFile, "natsconutilclient") {
		return apiName + "-nats-util-client.go"
	}
	if strings.Contains(templateFile, "config") {
		return apiName + "-config.go"
	}
	if strings.Contains(templateFile, "devconf") {
		return "config-dev.json"
	}
	if strings.Contains(templateFile, "commandtoevent") {
		return apiName + "-CommandHandler.go"
	}
	if strings.Contains(templateFile, "liquibase") {
		return apiName + "-liqubase.xml"
	}
	if strings.Contains(templateFile, "docker") {
		return "Dockerfile"
	}
	if strings.Contains(templateFile, "readme") {
		return "README.md"
	}

	return ""

}
