package com.gogenetic.restful.{{lowercase .API.Name}};

import org.mapstruct.Mapper;
import com.gogenetic.restful.{{lowercase .API.Name}}.model.*;
import java.util.List;
import org.mapstruct.*;
{{$API := .API.Name}}
@Mapper
public interface {{$API}}Mapper {
    {{range  $i, $e := .Mapping.Map}}
    {{ if eq $e.Name "convertToDoDomainToDo" }}
        {{range  $j, $f := $e.VariableMapping}}
        @Mapping(source = "{{firstsmall $f.From}}", target = "{{firstsmall $f.To}}")
        {{end}}
        {{$e.To}} to{{$e.To}}({{$e.From}} {{lowercase $e.From}});

        List<{{$e.To}}> to{{$e.To}}s(List<{{$e.From}}> {{lowercase $e.From}});
    {{end}}
    
    {{ if eq $e.Name "convertToDoToDoDomain" }}
        {{range  $j, $f := $e.VariableMapping}}
        @Mapping(source = "{{firstsmall $f.From}}", target = "{{firstsmall $f.To}}")
        {{end}}
        {{$e.To}} to{{$e.To}}({{$e.From}} {{lowercase $e.From}});
    {{end}}
    {{end}}
}
