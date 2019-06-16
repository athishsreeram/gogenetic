package data

// AutoGeneratedCli Create & copied from https://xuri.me/toml-to-go/
type AutoGeneratedCli struct {
	Gogenetic struct {
		Apiname              string `toml:"Apiname"`
		TomlDir              string `toml:"TomlDir"`
		Escqrsread           string `toml:"Escqrsread"`
		Esreadoutput         string `toml:"Esreadoutput"`
		Eventstorereadoutput string `toml:"eventstorereadoutput"`
		Cudoutput            string `toml:"Cudoutput"`
		Escqrscud            string `toml:"Escqrscud"`
		Dir                  string `toml:"Dir"`
		OutDir               string `toml:"outDir"`
		Crud                 string `toml:"Crud"`
		Crudoutput           string `toml:"Crudoutput"`
		Eswithoutcqrsoutput  string `toml:"Eswithoutcqrsoutput"`
		Eswithoutcqrs        string `toml:"Eswithoutcqrs"`
		Lang                 string `toml:"Lang"`
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
