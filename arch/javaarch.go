package arch

import (
	"gogenetic/gogexec"

	"gogenetic/data"
)

func JavaLangArch(conf data.AutoGeneratedCli, archType string, templateFile string) {
	//4. Set Value to the CLI Stucts input
	

	if archType == "crud" {

		conf.Gogenetic.Crud = "java/"
		conf.Gogenetic.Crudoutput = conf.Gogenetic.OutDir + "/crud"

		//gogfile.CreateFile(conf.Gogenetic.Lang, conf.Gogenetic.TomlDir, conf.Gogenetic.Crud+"proto-grpcresttemplate.tpl", conf.Gogenetic.Crudoutput)
	
		gogexec.MoveTo(conf.Gogenetic.Crudoutput)

	

	}
 
}


