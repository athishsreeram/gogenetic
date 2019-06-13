package com.gogenetic.restful.{{lowercase .API.Name}}.model;

import lombok.Data;

{{$Ind := .Models.Index}}{{range  $i, $e := .Models.Model}}{{$temp := tostring $i}}{{if eq $temp $Ind}}
@Data 
public class {{$e.Name}}  {
{{range  $j, $f := $e.Variable}}
{{ if eq (convertjavatype $f.Type) "repeated" }}List<{{removeplural (titlecase $f.Name)}}>{{end}}{{ if ne (convertjavatype $f.Type) "" }} {{ if and (ne (convertjavatype $f.Type) "object")  (ne (convertjavatype $f.Type) "repeated") }} {{convertjavatype $f.Type}} {{end}} {{end}} {{ if eq (convertjavatype $f.Type) "object" }} {{titlecase $f.Name}}{{end}} {{$f.Name}} = {{(plus1 $i)}}; {{end}} 
}{{end}}{{end}}