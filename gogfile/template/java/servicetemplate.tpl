package com.gogenetic.restful.{{lowercase .API.Name}};

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import com.gogenetic.restful.{{lowercase .API.Name}}.model.*;

@RequiredArgsConstructor
{{$API := .API.Name}}
@Service
public class {{$API}}Service {
     {{range  $i, $e := .Mapping.Map}}
    {{ if eq $e.Name "convertToDoDomainToDo" }}
    private {{$e.From}}Repository {{lowercase $API}}Respository;
    
    public List<{{$e.From}}> findAll() {
        return {{lowercase $API}}Respository.findAll();
    }

    public Optional<{{$e.From}}> findById(Long id) {
        return {{lowercase $API}}Respository.findById(id);
    }

    public {{$e.From}} save({{$e.From}} stock) {
        return {{lowercase $API}}Respository.save(stock);
    }

    public void deleteById(Long id) {
        {{lowercase $API}}Respository.deleteById(id);
    }    {{end}}{{end}}
}
