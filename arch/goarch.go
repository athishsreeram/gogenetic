package arch

import (
	"gogenetic/gogexec"
	"gogenetic/gogfile"
	"os"

	"gogenetic/data"
)

func GoLangArch(conf data.AutoGeneratedCli, archType string, templateFile string) {
	//4. Set Value to the CLI Stucts input
	if archType == "es-sync-with-cqrs" {

		conf.Gogenetic.Tomlesread = conf.Gogenetic.Dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = "go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = "go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = conf.Gogenetic.OutDir + "/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = conf.Gogenetic.OutDir + "/eventstore-read-output"
		conf.Gogenetic.Cudoutput = conf.Gogenetic.OutDir + "/es-cud-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Esreadoutput)

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Eventstorereadoutput)

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"proto-grpcresttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"servicenatstemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcrestservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"cmdservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natssubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natspubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"servicetodomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natsconutilclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"configtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"devconftemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"commandtoeventtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormcommandstoredomaintemplate.tpl", conf.Gogenetic.Cudoutput)

		gogexec.MoveTo(conf.Gogenetic.Esreadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Esreadoutput)

		gogexec.MoveTo(conf.Gogenetic.Eventstorereadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Eventstorereadoutput)

		gogexec.MoveTo(conf.Gogenetic.Cudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Cudoutput)

	}

	if archType == "es-async-with-cqrs" {

		conf.Gogenetic.Tomlesread = conf.Gogenetic.Dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = "go/es-cqrs-read/"
		conf.Gogenetic.Escqrscud = "go/es-cqrs-cud/"
		conf.Gogenetic.Esreadoutput = conf.Gogenetic.OutDir + "/es-read-output"
		conf.Gogenetic.Eventstorereadoutput = conf.Gogenetic.OutDir + "/eventstore-read-output"
		conf.Gogenetic.Cudoutput = conf.Gogenetic.OutDir + "/es-cud-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Esreadoutput)

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Eventstorereadoutput)

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"proto-grpcresttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"serviceasyncnatstemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcrestservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"cmdservertemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"grpcclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natssubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natspubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"servicetodomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natsconutilclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"configtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"devconftemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"commandtoeventtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormcommandstoredomaintemplate.tpl", conf.Gogenetic.Cudoutput)

		gogexec.MoveTo(conf.Gogenetic.Esreadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Esreadoutput)

		gogexec.MoveTo(conf.Gogenetic.Eventstorereadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Eventstorereadoutput)

		gogexec.MoveTo(conf.Gogenetic.Cudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Cudoutput)

	}

	if archType == "es-async-with-cqrs-read" {

		conf.Gogenetic.Tomlesread = conf.Gogenetic.Dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = "go/es-cqrs-read/"
		conf.Gogenetic.Esreadoutput = conf.Gogenetic.OutDir + "/es-read-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Esreadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Esreadoutput)

		gogexec.MoveTo(conf.Gogenetic.Esreadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Esreadoutput)

	}

	if archType == "es-cqrs-eventstore-read" {

		conf.Gogenetic.Tomlesread = conf.Gogenetic.Dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrsread = "go/es-cqrs-read/"
		conf.Gogenetic.Eventstorereadoutput = conf.Gogenetic.OutDir + "/eventstore-read-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"proto-grpcresttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"servicecrudtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcrestservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"cmdservertemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"grpcclienttemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"xormdomaintemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"configtemplate.tpl", conf.Gogenetic.Eventstorereadoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.Tomlesread, conf.Gogenetic.Escqrsread+"devconftemplate.tpl", conf.Gogenetic.Eventstorereadoutput)

		gogexec.MoveTo(conf.Gogenetic.Eventstorereadoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Eventstorereadoutput)

		gogexec.MoveTo(conf.Gogenetic.Cudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Cudoutput)
	}

	if archType == "es-async-with-cqrs-cmd-event-handler-cud" {

		conf.Gogenetic.Tomlesread = conf.Gogenetic.Dir + "/toml/eventstore-read.toml"
		conf.Gogenetic.Escqrscud = "go/es-cqrs-cud/"
		conf.Gogenetic.Cudoutput = conf.Gogenetic.OutDir + "/es-cud-output"
		// To-do dont know what this is for
	}

	if archType == "es-async-cmdhandler-with-cqrs" {

		conf.Gogenetic.Escqrscud = "go/es-cqrs-cud/"
		conf.Gogenetic.Cudoutput = conf.Gogenetic.OutDir + "/es-cmdhandler-cud-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natssubclientchtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natspubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natsconutilclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"configtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"devconftemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormesdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"commandtoeventtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormcommandstoredomaintemplate.tpl", conf.Gogenetic.Cudoutput)

		gogexec.MoveTo(conf.Gogenetic.Cudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Cudoutput)

	}

	if archType == "es-async-eventhandler-with-cqrs" {

		conf.Gogenetic.Escqrscud = "go/es-cqrs-cud/"
		conf.Gogenetic.Cudoutput = conf.Gogenetic.OutDir + "/es-eventhandler-cud-output"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"proto-grpcresttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natssubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natspubclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"servicetodomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"natsconutilclienttemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"configtemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"devconftemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormesdomaintemplate.tpl", conf.Gogenetic.Cudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Escqrscud+"xormcommandstoredomaintemplate.tpl", conf.Gogenetic.Cudoutput)

		gogexec.MoveTo(conf.Gogenetic.Cudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Cudoutput)

	}

	if archType == "crud" {

		conf.Gogenetic.Crud = "go/"
		conf.Gogenetic.Crudoutput = conf.Gogenetic.OutDir + "/crud"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"proto-grpcresttemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"servicecrudtemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"grpcservertemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"grpcrestservertemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"cmdservertemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"grpcclienttemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"xormdomaintemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"configtemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"devconftemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"docker/dockertemplate.tpl", conf.Gogenetic.Crudoutput)

		gogexec.MoveTo(conf.Gogenetic.Crudoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Crudoutput)

	}

	if archType == "es-sync-without-cqrs" {
		conf.Gogenetic.Eswithoutcqrs = "go/"
		conf.Gogenetic.Eswithoutcqrsoutput = conf.Gogenetic.OutDir + "/es-without-cqrs"

		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"proto-grpcresttemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"servicenatstemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"grpcservertemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"grpcrestservertemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"cmdservertemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"grpcclienttemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"xormdomaintemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"natssubclienttemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"natspubclienttemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"servicetodomaintemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"natsconutilclienttemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"configtemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)
		gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Eswithoutcqrs+"devconftemplate.tpl", conf.Gogenetic.Eswithoutcqrsoutput)

		gogexec.MoveTo(conf.Gogenetic.Eswithoutcqrsoutput)

		runGRPC(conf)

		formatCode(conf.Gogenetic.Dir + "/" + conf.Gogenetic.Eswithoutcqrsoutput)
	}

	gogexec.MoveTo(conf.Gogenetic.Dir + "/" + conf.Gogenetic.OutDir)
	applyGoMod(conf.Gogenetic.OutDir)
}

func runGRPC(conf data.AutoGeneratedCli) {
	grpcargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--go_out=plugins=grpc:proto", conf.Gogenetic.Apiname + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcargs)

	grpcgatewayargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--grpc-gateway_out=logtostderr=true:proto", conf.Gogenetic.Apiname + "-service.proto"}
	gogexec.ExecuteProtoCmd(grpcgatewayargs)

	grpcswaggerargs := []string{"--proto_path=proto", "-I/usr/local/include", "-I.", "-I" + os.Getenv("GOPATH") + "/src", "-I" + os.Getenv("GOPATH") + "/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis", "--swagger_out=logtostderr=true:proto", conf.Gogenetic.Apiname + "-service.proto"}
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
