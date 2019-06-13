package com.gogenetic.restful.{{lowercase .API.Name}};

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
{{$API := .API.Name}}
@Service
public class {{$API}}Service {
    private final {{$API}}Respository {{$API}}Respository;

    public List<{{$API}}> findAll() {
        return {{$API}}Respository.findAll();
    }

    public Optional<{{$API}}> findById(Long id) {
        return {{$API}}Respository.findById(id);
    }

    public {{$API}} save({{$API}} stock) {
        return {{$API}}Respository.save(stock);
    }

    public void deleteById(Long id) {
        {{$API}}Respository.deleteById(id);
    }
}
