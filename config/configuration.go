package config

type ArchTypes struct {
	ArchType []struct {
		Name     string   `toml:"name"`
		Projects []string `toml:"projects"`
	} `toml:"ArchType"`
	Projects []struct {
		Name             string   `toml:"name"`
		TemplateBasePath string   `toml:"templateBasePath"`
		Templates        []string `toml:"templates"`
		OutputDir        string   `toml:"outputDir"`
		TemplateToml     string   `toml:"templateToml"`
		ApiName          string   `toml:"apiName"`
		Grpc             string   `toml:"grpc"`
	} `toml:"projects"`
}

type Files struct {
	FileLoc []struct {
		Key                string `toml:"key"`
		FileLoc            string `toml:"fileLoc"`
		FileName           string `toml:"fileName"`
		AddApiName         string `toml:"addApiName"`
		AddDomainModelName string `toml:"addDomainModelName"`
		AddModelName       string `toml:"addModelName"`
	} `toml:"GoFileLoc"`
}
