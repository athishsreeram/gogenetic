package servicetodomain

import (
	"{{.API.Name}}-output/client/nats/pub"
	"{{.API.Name}}-output/domain"
	"{{.API.Name}}-output/proto"
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
	func {{$e.Operationid}}Processing(key string, msg string) {{if or (eq $e.Operationid "Create") (eq $e.Operationid "Update") (eq $e.Operationid "Read") }} *proto.ToDo {{end}} {{if  (eq $e.Operationid "Delete")  }} bool {{end}} {{if  (eq $e.Operationid "ReadAll")  }}[]*proto.ToDo {{end}} {
		// TO-DO
		var dat proto.{{$e.Request}}
		err := json.Unmarshal([]byte(msg), &dat)
		if err != nil {
			log.Println(err)
		}
		{{ if (eq $e.Operationid "Create") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			log.Println("DTO Data", dat.{{titlecase $e.To}})
			{{firstsmall $e.From}} := domain.ConvertToDo2ToDoDomains(dat.ToDo)
			log.Println("Domain Data ", {{firstsmall $e.From}})
			domain.Create{{$e.From}}({{firstsmall $e.From}})
			{{$e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.Sno))
			return {{$e.To}}
			{{end}}{{end}}{{end}}{{end}}
		{{end}}
		{{ if (eq $e.Operationid "Update") }}
			log.Println("DTO Data", dat.Id)
			log.Println("DTO Data", dat.ToDo)
			tododomain := domain.ConvertToDo2ToDoDomains(dat.ToDo)
			log.Println("Domain Data ", tododomain)

			domain.UpdateToDoDomains(tododomain.Sno, tododomain)
			toDo := domain.ConvertToDoDomains2ToDo(domain.ReadToDoDomains(tododomain.Sno))
			return toDo
		{{end}}
		{{ if (eq $e.Operationid "Delete") }}
			log.Println("DTO Data", dat.Id)
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				domain.DeleteToDoDomains(n)
			}
			return true
		{{end}}
		{{ if (eq $e.Operationid "Read") }}
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				return domain.ConvertToDoDomains2ToDo(domain.ReadToDoDomains(n))
			}
			return nil
		{{end}}
		{{ if (eq $e.Operationid "ReadAll") }}
				var toDos []*proto.ToDo
				for _, tododomain := range domain.ReadAllToDoDomains() {
					toDo := domain.ConvertToDoDomains2ToDo(domain.ReadToDoDomains(tododomain.Sno))
					toDos = append(toDos, toDo)
				}
				return toDos
		{{end}}
	}
{{end}}