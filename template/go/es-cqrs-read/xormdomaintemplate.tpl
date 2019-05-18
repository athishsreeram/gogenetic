package domain

import (
	proto "{{.API.Name}}-{{.Architechture.Name}}-read-output/proto"
	mapstructure "github.com/mitchellh/mapstructure"
	"log"
	_ "github.com/go-sql-driver/mysql"
    "github.com/go-xorm/xorm"
	cfg "{{.API.Name}}-{{.Architechture.Name}}-read-output/config"
){{$DomainModel := .DomainModels.DomainModel}}
var engine *xorm.Engine

{{range  $i, $e := .Mapping.Map}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
type {{$e.From}} struct { {{range $k1, $g1 := $f.Variable}} {{range $k2, $g2 := $e.VariableMapping}} {{if eq $k1 $k2}}
	{{$g1.Name}}  {{$g1.Type}} `mapstructure:"{{$g2.To}}"` {{end}}{{end}}{{end}}
}
func ReadAll{{$e.From}}() []{{$e.From}} {
	var err error
    engine, err = xorm.NewEngine("mysql", cfg.Conf.DBCon)

	var {{firstsmall $e.From}} []{{$e.From}}
	engine.Find(&{{firstsmall $e.From}})
	log.Println("{}", {{firstsmall $e.From}})

	if err != nil {
		log.Println(err)
	}

	return {{firstsmall $e.From}}

}

func Read{{$e.From}}(Sno int) {{$e.From}} {
	var err error
    engine, err = xorm.NewEngine("mysql", cfg.Conf.DBCon)

	var {{firstsmall $e.From}}  = {{$e.From}}{Sno:Sno}
	has, err := engine.Get(&{{firstsmall $e.From}})
	log.Println("{}", {{firstsmall $e.From}})
	if err != nil {
		log.Println(err)
	}
	log.Println(has)

	return {{firstsmall $e.From}}

}


{{end}}
func Convert{{titlecase $e.From}}2{{titlecase $e.To}}({{lowercase $e.From}} interface{}) ({{lowercase $e.To}} *proto.{{titlecase $e.To}}) {
	err{{$i}} := mapstructure.Decode({{lowercase $e.From}}, &{{lowercase $e.To}})
	if err{{$i}} != nil {
		panic(err{{$i}})
	}
	return {{lowercase $e.To}}
}{{end}}{{end}}
{{if eq  $e.Type "dto2domain"}}
func Convert{{titlecase $e.From}}2{{titlecase $e.To}}({{lowercase $e.From}} *proto.{{titlecase $e.From}}) ({{lowercase $e.To}} {{titlecase $e.To}}) {
	err{{$i}} := mapstructure.Decode({{lowercase $e.From}}, &{{lowercase $e.To}})
	if err{{$i}} != nil {
		panic(err{{$i}})
	}
	return {{lowercase $e.To}}
}{{end}}{{end}}