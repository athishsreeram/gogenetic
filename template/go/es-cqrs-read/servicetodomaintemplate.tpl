package servicetodomain

import (
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/client/nats/pub"
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/domain"
	"{{.API.Name}}-{{.Architechture.Name}}-read-output/proto"
	"encoding/json"
	"log"
	"strconv"
	"strings"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}
var delimiter = "=@="
func {{$apiname}}ServiceProcesing(data string) {

	s := strings.Split(data, delimiter)
	key, msg := s[0], s[1]
	log.Println("%s %s", key, msg)

	{{range  $i, $e := .API.Operations}}

	if key == "{{$e.Operationid}}" {
		pub.Send("{{$apiname}}", "{{$e.Operationid}}d", {{$e.Operationid}}Processing(key, msg))
	}
	
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