package servicetodomain

import (
	"Test-output/domain"
	"Test-output/proto"
	"encoding/json"
	"log"
	"strconv"
	"strings"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}}
func {{$apiname}}ServiceProcesing(data string) {

	s := strings.Split(data, "=@=")
	key, msg := s[0], s[1]
	log.Println("%s %s", key, msg)

	{{range  $i, $e := .API.Operations}}

	if strings.Contains(key, "{{$e.Operationid}}") {
		{{$e.Operationid}}Processing(key, msg)
	}
	
	{{end}}
}

{{range  $i, $e := .API.Operations}}
	func {{$e.Operationid}}Processing(key string, msg string) {{if or (eq $e.Operationid "Create") (eq $e.Operationid "Update") (eq $e.Operationid "Read") }} *proto.ToDo {{end}} {{if  (eq $e.Operationid "Delete")  }} bool {{end}} {{if  (eq $e.Operationid "ReadAll")  }} []domain.ToDoDomain {{end}} {
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
				toDos := []proto.ToDo
			    for i, domain := range domain.ReadAllToDoDomain() {
						toDos = append(toDos,domain.ConvertToDoDomain2ToDo(domain))
				}
				return toDos
		{{end}}
	}
{{end}}