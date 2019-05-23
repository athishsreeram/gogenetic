package servicetodomain

import (
	"{{.Architechture.Outputdir}}/client/nats/pub"
	"{{.Architechture.Outputdir}}/domain"
	"{{.Architechture.Outputdir}}/proto"
	"encoding/json"
	"log"
	"strconv"
	"github.com/Jeffail/gabs"
	cfg "{{.Architechture.Outputdir}}/config"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}{{$DomainModel := .DomainModels.DomainModel}}

func {{$apiname}}EventProcesing(data string) {

	jsonObj, _ := gabs.ParseJSON([]byte(data))

	key, msg := jsonObj.Search("event").Data().(string), data
	log.Println("%s %s", key, msg)

	{{range  $i, $e := .API.Operations}}
		{{range  $j, $f := $DomainModel}}
	if key == "{{$f.Name}}Event{{$e.Operationid}}d" {
		pub.Send(cfg.Conf.NATSSubj, "{{$f.Name}}Event{{$e.Operationid}}Completed","event", {{$e.Operationid}}Processing(key, msg),jsonObj.Search("uuid").Data().(string))
	}
		{{end}}
	{{end}}
}

{{$DomainModel := .DomainModels.DomainModel}}
{{$MappingMap := .Mapping.Map}}

{{range  $i, $e := .API.Operations}}
	func {{$e.Operationid}}Processing(key string, msg string) {{if or (eq $e.Operationid "Create") (eq $e.Operationid "Update") (eq $e.Operationid "Read") (eq $e.Operationid "ReadAll")  }} {{range  $j, $f := $MappingMap}}	{{if eq  $f.Type "domain2dto"}} {{range  $k, $g := $DomainModel}}{{if eq  $f.From $g.Name}}  {{if eq  $e.Operationid "ReadAll"}}[]{{end}}*proto.{{$f.To}} {{end}}{{end}}{{end}}{{end}} {{end}} {{if  (eq $e.Operationid "Delete")  }} bool {{end}} {
		// TO-DO
		var dat proto.{{$e.Request}}
		err := json.Unmarshal([]byte(msg), &dat)
		if err != nil {
			log.Println(err)
		}
		{{ if (eq $e.Operationid "Create") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			log.Println("DTO Data", dat.{{titlecase $e.To}})
			{{firstsmall $e.From}} := domain.Convert{{titlecase $e.To}}2{{titlecase $e.From}}(dat.{{titlecase $e.To}})
			log.Println("Domain Data ", {{firstsmall $e.From}})
			domain.Create{{$e.From}}({{firstsmall $e.From}})
			{{$e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.Sno))
			return {{$e.To}}
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "Update") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			log.Println("DTO Data", dat.Id)
			log.Println("DTO Data", dat.{{titlecase $e.To}})
			{{firstsmall $e.From}} := domain.Convert{{titlecase $e.To}}2{{titlecase $e.From}}(dat.{{titlecase $e.To}})
			log.Println("Domain Data ", {{firstsmall $e.From}})

			domain.Update{{$e.From}}({{firstsmall $e.From}}.Sno,{{firstsmall $e.From}} )
			{{$e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.Sno))
			return {{$e.To}}
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "Delete") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			log.Println("DTO Data", dat.Id)
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				domain.Delete{{titlecase $e.From}}(n)
			}
			return true
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "Read") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				{{$e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}(n))
				return {{$e.To}}
			}
			return nil
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "ReadAll") }}
				{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
				var {{$e.To}}s []*proto.{{$e.To}}
				for _, {{firstsmall $e.From}} := range domain.ReadAll{{titlecase $e.From}}() {
					{{$e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.Sno))
					{{$e.To}}s = append({{$e.To}}s, {{$e.To}})
				}
				return {{$e.To}}s
				{{end}}{{end}}{{end}}{{end}}
		{{end}}
	}
{{end}}