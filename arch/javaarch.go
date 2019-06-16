package arch

import (
	"gogenetic/gogexec"
	"gogenetic/gogfile"
	"strconv"

	"gogenetic/data"
)

func JavaLangArch(conf data.AutoGeneratedCli, archType string, templateFile string) {
	//4. Set Value to the CLI Stucts input

	if archType == "crud" {

		conf.Gogenetic.Crud = "java/"
		conf.Gogenetic.Crudoutput = conf.Gogenetic.OutDir + "/crud"

		gogfile.CreateFile(conf, "go/proto-grpcresttemplate.tpl", conf.Gogenetic.Crudoutput)
		gogexec.MoveTo(conf.Gogenetic.Crudoutput)
		runSwagger(conf, ".")
		gogexec.MoveTo("../..")
		gogexec.RemoveFile(conf.Gogenetic.Crudoutput + "/" + conf.API.Name + "-service.proto")

		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"docker/dockertemplate.tpl", conf.Gogenetic.Crudoutput)

		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"pomtemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"applicationtemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"domainmodeltemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"repositorytemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"servicetemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"controllertemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"mapstructmappertemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"configtemplate.tpl", conf.Gogenetic.Crudoutput)
		gogfile.CreateFile(conf, conf.Gogenetic.Crud+"crudreadmetemplate.tpl", conf.Gogenetic.Crudoutput)

		noOfModel := len(conf.Models.Model)
		for i := 0; i < noOfModel; i++ {
			conf.Models.Index = strconv.Itoa(i)
			gogfile.CreateFile(conf, conf.Gogenetic.Crud+"modeltemplate.tpl", conf.Gogenetic.Crudoutput)
		}

	}

}
