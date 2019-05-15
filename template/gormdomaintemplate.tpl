package domain

import (
	proto "{{.API.Name}}-output/proto"
	mapstructure "github.com/mitchellh/mapstructure"
	"log"
	"github.com/jinzhu/gorm"
	_ "github.com/go-sql-driver/mysql"
){{$DomainModel := .DomainModels.DomainModel}}
var conn = "root:@tcp(localhost:3306)/GOGENETIC_SCHEMA?charset=utf8&parseTime=True&loc=Local"
{{range  $i, $e := .Mapping.Map}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
type {{$e.From}} struct { {{range $k1, $g1 := $f.Variable}} {{range $k2, $g2 := $e.VariableMapping}} {{if eq $k1 $k2}}
	{{$g1.Name}}  {{$g1.Type}} `mapstructure:"{{$g2.To}}"` {{end}}{{end}}{{end}}
}
func ReadAll{{$e.From}}() []{{$e.From}} {
	db, err := gorm.Open("mysql", conn)
	if err != nil {
		log.Println(err)
	}
	defer db.Close()

	var {{firstsmall $e.From}} []{{$e.From}}
	db.Find(&{{firstsmall $e.From}})
	log.Println("{}", {{firstsmall $e.From}})

	return {{firstsmall $e.From}}

}

func Read{{$e.From}}(Sno int) {{$e.From}} {
	db, err := gorm.Open("mysql", conn)
	if err != nil {
		log.Println(err)
	}
	defer db.Close()
	var {{firstsmall $e.From}} {{$e.From}}

	db.Where("Sno = ?", Sno).Find(&{{firstsmall $e.From}})
	log.Println("{}", {{firstsmall $e.From}})

	return {{firstsmall $e.From}}

}

func Create{{$e.From}}({{firstsmall $e.From}} {{$e.From}}) {

	db, err := gorm.Open("mysql", conn)
	if err != nil {
		log.Println(err)
	}
	defer db.Close()

	db.Create(&{{firstsmall $e.From}})
	log.Println("Successfully Created {}", &{{firstsmall $e.From}})

}

func Delete{{$e.From}}(Sno int) {
	db, err := gorm.Open("mysql", conn)
	if err != nil {
		log.Println(err)
	}
	defer db.Close()

	var {{firstsmall $e.From}} {{$e.From}}

	db.Where("Sno = ?", Sno).Find(&{{firstsmall $e.From}})
	db.Delete(&{{firstsmall $e.From}})

	log.Println("Successfully Deleted {}", {{firstsmall $e.From}})
}

func Update{{$e.From}}(Sno int, {{firstsmall $e.From}} {{$e.From}}) {{$e.From}} {
	db, err := gorm.Open("mysql", conn)
	if err != nil {
		log.Println(err)
	}
	defer db.Close()

	db.Where("Sno = ?", Sno).Find(&{{firstsmall $e.From}})
	log.Println("{}", {{firstsmall $e.From}})

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