
import org.mapstruct.Mapper;

import java.util.List;
{{$API := .API.Name}}
@Mapper
public interface {{$API}}Mapper {
    {{range  $i, $e := .Mapping.Map}}
    {{ if eq $e.Name "convertToDoDomainToDo" }}
        {{$e.To}} to{{$e.To}}({{$e.From}} {{lowercase $e.From}});

        List<{{$e.To}}> to{{$e.To}}s(List<{{$e.To}}> {{lowercase $e.From}}s);
    {{end}}
    
    {{ if eq $e.Name "convertToDoToDoDomain" }}
        {{$e.To}} to{{$e.To}}({{$e.From}} {{lowercase $e.From}});
    {{end}}
    {{end}}
}
