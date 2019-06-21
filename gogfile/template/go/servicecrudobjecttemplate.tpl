package v1

import (
	"{{.Architechture.Outputdir}}/proto"
	"{{.Architechture.Outputdir}}/domain"
	"context"
	"log"
)
{{$apiname := .API.Name}} {{$model := .Models.Model}} {{$DomainModel := .DomainModels.DomainModel}} {{$MappingMap := .Mapping.Map}}
const (
	// apiVersion is version of API is provided by server
	apiVersion = "v1"
)



// {{(lowercase $apiname)}}Server is implementation of proto.{{$apiname}}Server proto interface
type {{(lowercase $apiname)}}Server struct {

}

// New{{$apiname}}ServiceServer creates {{$apiname}} service
func New{{$apiname}}ServiceServer() proto.{{$apiname}}ServiceServer {
	return &{{(lowercase $apiname)}}Server{}
}


{{range  $i, $e := .API.Operations}}
// Create new todo task
func (s *{{(lowercase $apiname)}}Server) {{$e.Operationid}}(ctx context.Context, req *proto.{{$e.Request}}) (*proto.{{$e.Response}}, error) {
	// TO-DO 
		{{ if (eq $e.Operationid "Create") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			var {{firstsmall $e.To}} *proto.{{$e.To}}
			{{firstsmall $e.From}} := domain.Convert{{titlecase $e.To}}2{{titlecase $e.From}}({{firstsmall $e.To}})
			log.Println("Domain Data ", {{firstsmall $e.From}})
			domain.Create{{$e.From}}({{firstsmall $e.From}})
			{{firstsmall $e.To}} = domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.{{$e.Primary}}))
			log.Println("Response DTO Data", {{firstsmall $e.To}})
			{{end}}{{end}}{{end}}{{end}}
           resp := &proto.{{$e.Response}}{
            {{range  $j,$g := $e.ResponseVariable}}
                 {{titlecase $g.Name}} : {{if ne $g.ModelVal ""}}{{firstsmall $g.ModelVal}}{{end}} {{if eq $g.Name "v1"}} {{$g.Value}} {{end}},
            {{end}}
		   };

			return resp, nil
		 

		{{end}}
		{{ if (eq $e.Operationid "Update") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			var {{firstsmall $e.To}} *proto.{{$e.To}}
			{{firstsmall $e.From}} := domain.Convert{{titlecase $e.To}}2{{titlecase $e.From}}({{firstsmall $e.To}})
			log.Println("Domain Data ", {{firstsmall $e.From}})
			domain.Update{{$e.From}}({{firstsmall $e.From}}.{{$e.Primary}},{{firstsmall $e.From}} )
			{{firstsmall $e.To}} = domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.{{$e.Primary}}))
			log.Println("Response DTO Data", {{firstsmall $e.To}})
			{{end}}{{end}}{{end}}{{end}}

			resp := &proto.{{$e.Response}}{
            {{range  $j,$g := $e.ResponseVariable}}
                 {{titlecase $g.Name}} : {{if ne $g.ModelVal ""}}{{firstsmall $g.ModelVal}}{{end}} {{if eq $g.Name "v1"}} {{$g.Value}} {{end}},
            {{end}}
		   };

			return resp, nil
		{{end}}
		{{ if (eq $e.Operationid "Delete") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			var {{firstsmall $e.To}} *proto.{{$e.To}}
			{{firstsmall $e.From}} := domain.Convert{{titlecase $e.To}}2{{titlecase $e.From}}({{firstsmall $e.To}})
			domain.Delete{{titlecase $e.From}}({{firstsmall $e.From}}.{{$e.Primary}})
			{{end}}{{end}}{{end}}{{end}}

			resp := &proto.{{$e.Response}}{
            {{range  $j,$g := $e.ResponseVariable}}
                 {{titlecase $g.Name}} : {{$g.Value}},
            {{end}}
		   };

			return resp, nil
		{{end}}
		{{ if (eq $e.Operationid "Read") }}
			{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
			var {{firstsmall $e.To}} *proto.{{$e.To}}
			{{firstsmall $e.To}} = domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.To}}.{{$e.Primary}}))
			{{end}}{{end}}{{end}}{{end}}

			resp := &proto.{{$e.Response}}{
            {{range  $j,$g := $e.ResponseVariable}}
                 {{titlecase $g.Name}} : {{if eq $g.Type "object"}}{{firstsmall $g.Name}}{{end}} {{if eq $g.Type "int"}}{{$g.Value}}{{end}},
            {{end}}
		   };

			return resp, nil
		{{end}}
		{{ if (eq $e.Operationid "ReadAll") }}
				{{range  $i, $e := $MappingMap}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
				var {{firstsmall $e.To}}s []*proto.{{$e.To}}
				for _, {{firstsmall $e.From}} := range domain.ReadAll{{titlecase $e.From}}() {
					{{firstsmall $e.To}} := domain.Convert{{titlecase $e.From}}2{{titlecase $e.To}}(domain.Read{{$e.From}}({{firstsmall $e.From}}.{{$e.Primary}}))
					{{firstsmall $e.To}}s = append({{firstsmall $e.To}}s, {{firstsmall $e.To}})
				}
				{{end}}{{end}}{{end}}{{end}}

				resp := &proto.{{$e.Response}}{
            {{range  $j,$g := $e.ResponseVariable}}
                 {{titlecase $g.Name}} : {{if eq $g.Type "repeated"}}{{firstsmall $g.Name}}{{end}} {{if ne $g.Type "repeated"}}{{$g.Value}}{{end}},
            {{end}}
		   };

			return resp, nil
		{{end}}
	
	
}
{{end}}