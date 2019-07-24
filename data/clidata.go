package data

// AutoGeneratedCli Create & copied from https://xuri.me/toml-to-go/
type AutoGeneratedCli struct {
	Gogenetic struct {
		TomlDir              string `toml:"TomlDir"`
		OutDir               string `toml:"outDir"`
		Lang                 string `toml:"Lang"`
		ArchType             string `toml:"ArchType"`
		TemplateFile         string `toml:"TemplateFile"`
		Dir                  string `toml:"Dir"`
		Escqrsread           string `toml:"Escqrsread"`
		Esreadoutput         string `toml:"Esreadoutput"`
		Eventstorereadoutput string `toml:"Eventstorereadoutput"`
		Cudoutput            string `toml:"Cudoutput"`
		Escqrscud            string `toml:"Escqrscud"`
		Crud                 string `toml:"Crud"`
		Crudoutput           string `toml:"Crudoutput"`
		Eswithoutcqrsoutput  string `toml:"Eswithoutcqrsoutput"`
		Eswithoutcqrs        string `toml:"Eswithoutcqrs"`
	} `toml:"Gogenetic"`
	API struct {
		Name string `toml:"Name"`
	} `toml:"API"`
	Models struct {
		Index string `toml:"index"`
		Model []struct {
			Name     string `toml:"name"`
			Variable []struct {
				Name  string `toml:"name"`
				Value string `toml:"value"`
				Type  string `toml:"type"`
			} `toml:"Variable"`
		} `toml:"Model"`
	} `toml:"Models"`
}

var (
	Cli *AutoGeneratedCli
)
