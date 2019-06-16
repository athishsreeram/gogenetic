package com.gogenetic.restful.{{lowercase .API.Name}};

import org.springframework.data.jpa.repository.JpaRepository;

{{$DomainModel := .DomainModels.DomainModel}}{{range  $i, $e := .Mapping.Map}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
public interface {{$e.From}}Repository extends JpaRepository <{{$e.From}},Long>  { 
}{{end}}{{end}}{{end}}{{end}}