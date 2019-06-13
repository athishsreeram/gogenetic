package com.gogenetic.restful.{{lowercase .API.Name}};

import com.gogenetic.restful.{{lowercase .API.Name}}.mode.*;
import io.swagger.annotations.*;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
{{$Model := .Models.Model}}
{{$API := .API.Name}}
@Controller
public class {{$API}}Controller {

    private final {{$API}}Service {{lowercase $API}}Service;
    private final {{$API}}Mapper {{lowercase $API}}Mapper;

    {{range $j,$a := .API.Operations}} 
    @RequestMapping(value = "{{.URL}}",
        produces = { "application/json" }, 
        consumes = { "application/json" },
        method = RequestMethod.{{.Protocol}})
        ResponseEntity<{{.Response}}> {{.Operationid}}(
            {{$n := len $a.RequestVariable}}
            {{$n := (minus1 $n) }}  
            {{range  $i,$f := $a.RequestVariable}}
            {{ if eq $f.Parameter "body" }}  @Valid @RequestBody  {{end}} {{ if eq $f.Parameter "query" }}  @Valid @RequestParam(value = "{{$f.Name}}", required = false)  {{end}} {{ if eq $f.Parameter "path" }} @PathVariable("{{$f.Name}}")   {{end}}
            {{ if eq (convertjavatype $f.Type) "repeated" }}{{ (convertjavatype $f.Type) }} {{removeplural (titlecase $f.Name)}}{{end}}{{ if ne (convertjavatype $f.Type) "" }} {{ if and (ne (convertjavatype $f.Type) "object")  (ne (convertjavatype $f.Type) "repeated") }} {{convertjavatype $f.Type}} {{end}} {{end}} {{ if eq (convertjavatype $f.Type) "object" }} {{titlecase $f.Name}}{{end}} {{$f.Name}}  {{if ne $i $n}} , {{end}}{{if eq (plus1 $i) $n}} {{end}}{{end}}
        ){
            {{ if (eq $a.Operationid "Create") }}
                {{lowercase $API}}Service.save({{lowercase $API}}Mapper.to{{$API}}({{lowercase $API}}));
                
            {{end}}

            {{ if (eq $a.Operationid "Update") }}
                {{$API}} {{lowercase $API}} = {{lowercase $API}}Mapper.to{{$API}}({{lowercase $API}});
                 {{range  $i,$f := $a.RequestVariable}}
                     {{ if eq $f.Parameter "path" }}  
                        {{lowercase $API}}.set{{titlecase $f.Name}}({{$f.Name}});
                        update =  {{$f.Name}};
                    {{end}}
                {{end}}
                {{lowercase $API}}Service.save({{lowercase $API}});
                 
            {{end}}
            {{ if (eq $a.Operationid "Delete") }}
                {{range  $i,$f := $a.RequestVariable}}
                     {{ if eq $f.Parameter "path" }}  
                     delete = {{lowercase $API}}Service.delete({{$f.Name}});
                 {{end}}
                {{end}}   
            {{end}}
            {{ if (eq $a.Operationid "Read") }}
                {{range  $i,$f := $a.RequestVariable}}
                 {{ if eq $f.Parameter "path" }}  
                    Optional<{{lowercase $API}}> {{lowercase $API}} = {{lowercase $API}}Service.findBy({{$f.Name}});
                    {{$API}} {{lowercase $API}} = {{lowercase $API}}Mapper.to{{$API}}({{lowercase $API}}.get())
                 {{end}}
                {{end}}  
            {{end}}
            {{ if (eq $a.Operationid "ReadAll") }}
               List<{{$API}}> {{lowercase $API}}s = {{lowercase $API}}Mapper.to{{$API}}s({{lowercase $API}}Service.findAll())
            {{end}}
            {{$m := len $a.ResponseVariable}}
            {{$m := (minus1 $m) }}  
            {{$a.Response}} {{lowercase $a.Response}} = new {{$a.Response}}(
            {{range  $j,$g := $a.ResponseVariable}}
                 {{$g.Name}} {{if ne $j $m}} , {{end}}{{if eq (plus1 $j) $m}} {{end}}
            {{end}}
            )
        }
    {{end}}
 
}