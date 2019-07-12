package com.gogenetic.restful.{{lowercase .API.Name}};
{{$API:=.API.Name}}{{$Map := .Mapping.Map}}
import com.gogenetic.restful.todo.model.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1")
public class {{$API}}Controller {

    private  {{$API}}Service {{lowercase $API}}Service;
    private  {{$API}}Mapper {{lowercase $API}}Mapper;

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
            {{range  $i, $e := $Map}}
            {{ if eq $e.Type "domain2dto" }}
                {{lowercase $API}}Service.save({{lowercase $API}}Mapper.to{{$e.From}}({{firstsmall $e.To}}));
                {{range  $j, $f := $e.VariableMapping}}
                {{if eq $e.Primary $f.From}}
                 {{$e.Primarytype}}  {{firstsmall $f.To}} = {{firstsmall $e.To}}.get{{$f.To}}();
                {{end}}
                {{end}}
            {{end}}
            {{end}}
            {{end}}
            
            {{ if (eq $a.Operationid "Update") }}
                 {{range  $i,$f := $a.RequestVariable}}
                     {{ if eq $f.Parameter "path" }}  
                        {{range  $i, $e := $Map}}
                        {{ if eq $e.Type "domain2dto" }} 
                        {{$e.From}} {{firstsmall $e.From}} = {{lowercase $API}}Mapper.to{{$e.From}}({{firstsmall $e.To}});
                        {{firstsmall $e.From}}.set{{titlecase $e.Primary}}({{$f.Name}});
                        {{convertjavatype $e.Primarytype}} updated =  {{$f.Name}};
                        {{lowercase $API}}Service.save({{firstsmall $e.From}});
                         {{end}}
                        {{end}}
                    {{end}}
                {{end}}
                
                 
            {{end}}
            
            {{ if (eq $a.Operationid "Delete") }}
                {{range  $i,$f := $a.RequestVariable}}
                     {{ if eq $f.Parameter "path" }}  
                     {{lowercase $API}}Service.deleteById(Long.valueOf({{$f.Name}}));
                     Boolean deleted = true;
                 {{end}}
                {{end}}   
            {{end}}
            
            {{ if (eq $a.Operationid "Read") }}
                {{range  $i,$f := $a.RequestVariable}}
                 {{ if eq $f.Parameter "path" }} 
                    {{range  $i, $e := $Map}}
                        {{ if eq $e.Type "domain2dto" }} 
                    Optional<{{$e.From}}> {{firstsmall $API}}Opt = {{lowercase $API}}Service.findById(Long.valueOf({{$f.Name}}));
                    {{$e.To}} {{firstsmall $e.To}} = {{firstsmall $API}}Mapper.to{{$e.To}}({{lowercase $API}}Opt.get());
                 {{end}}
                {{end}} 
                 {{end}}
                {{end}}  
            {{end}}
            
            {{ if (eq $a.Operationid "ReadAll") }}
                {{range  $i, $e := $Map}}
                        {{ if eq $e.Type "domain2dto" }}
               List<{{$e.To}}> {{firstsmall $e.To}}s = {{lowercase $API}}Mapper.to{{$e.To}}s({{lowercase $API}}Service.findAll());
            {{end}}
            {{end}}
            {{end}}

            {{$m := len $a.ResponseVariable}}
            {{$m := (minus1 $m) }}  
            {{$a.Response}} {{lowercase $a.Response}} = new {{$a.Response}}(
            {{range  $j,$g := $a.ResponseVariable}}
                 {{$g.Name}} {{if ne $j $m}} , {{end}}{{if eq (plus1 $j) $m}} {{end}}
            {{end}}
            );
            return ResponseEntity.ok({{lowercase $a.Response}});
        }
    {{end}}
 
}