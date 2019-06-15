package com.gogenetic.restful.{{lowercase .API.Name}};

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

{{$DomainModel := .DomainModels.DomainModel}}
{{range  $i, $e := .Mapping.Map}}	{{if eq  $e.Type "domain2dto"}} {{range  $j, $f := $DomainModel}}{{if eq  $e.From $f.Name}} 
@Entity
@Data 
public class {{$e.From}}  { {{range $k1, $g1 := $f.Variable}} {{range $k2, $g2 := $e.VariableMapping}}{{if eq $k1 $k2}}
{{if eq $e.Primary $g1.Name}}@Id     @GeneratedValue(strategy = GenerationType.IDENTITY){{end}}
private  {{convertjavatype $g1.Type}} {{$g1.Name}};{{end}}{{end}}{{end}}{{end}}
}{{end}}{{end}}{{end}}