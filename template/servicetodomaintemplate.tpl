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

{{range  $i, $e := .API.Operations}}
	func {{$e.Operationid}}Processing(key string, msg string) {{if or (eq $e.Operationid "Create") (eq $e.Operationid "Update") (eq $e.Operationid "Read") }} *proto.ToDo {{end}} {{if  (eq $e.Operationid "Delete")  }} bool {{end}} {{if  (eq $e.Operationid "ReadAll")  }}[]*proto.ToDo {{end}} {
		// TO-DO
		var dat proto.{{$e.Request}}
		err := json.Unmarshal([]byte(msg), &dat)
		if err != nil {
			log.Println(err)
		}
		{{ if (eq $e.Operationid "Create") }}
			log.Println("DTO Data", dat.ToDo)
			tododomain := domain.ConvertToDo2ToDoDomain(dat.ToDo)
			log.Println("Domain Data ", tododomain)
			domain.CreateToDoDomain(tododomain)
			toDo := domain.ConvertToDoDomain2ToDo(domain.ReadToDoDomain(tododomain.Sno))
			return toDo
		{{end}}
		{{ if (eq $e.Operationid "Update") }}
			log.Println("DTO Data", dat.Id)
			log.Println("DTO Data", dat.ToDo)
			tododomain := domain.ConvertToDo2ToDoDomain(dat.ToDo)
			log.Println("Domain Data ", tododomain)

			domain.UpdateToDoDomain(tododomain.Sno, tododomain)
			toDo := domain.ConvertToDoDomain2ToDo(domain.ReadToDoDomain(tododomain.Sno))
			return toDo
		{{end}}
		{{ if (eq $e.Operationid "Delete") }}
			log.Println("DTO Data", dat.Id)
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				domain.DeleteToDoDomain(n)
			}
			return true
		{{end}}
		{{ if (eq $e.Operationid "Read") }}
			n, err := strconv.Atoi(strconv.FormatInt(dat.Id, 10))
			if err == nil {
				return domain.ConvertToDoDomain2ToDo(domain.ReadToDoDomain(n))
			}
			return nil
		{{end}}
		{{ if (eq $e.Operationid "ReadAll") }}
				var toDos []*proto.ToDo
				for _, tododomain := range domain.ReadAllToDoDomain() {
					toDo := domain.ConvertToDoDomain2ToDo(domain.ReadToDoDomain(tododomain.Sno))
					toDos = append(toDos, toDo)
				}
				return toDos
		{{end}}
	}
{{end}}