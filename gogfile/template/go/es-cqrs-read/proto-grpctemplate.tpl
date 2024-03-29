syntax = "proto3";

package proto;

import "google/api/annotations.proto";

    
{{range .Models.Model}}
message {{.Name}} {
        {{range $i, $e :=.Variable}}
{{ if eq (convertproto .Type) "repeated" }}{{ (convertproto .Type) }} {{removeplural (titlecase .Name)}}{{end}}{{ if ne (convertproto .Type) "" }} {{ if and (ne (convertproto .Type) "object")  (ne (convertproto .Type) "repeated") }} {{convertproto .Type}} {{end}} {{end}} {{ if eq (convertproto .Type) "object" }} {{titlecase .Name}}{{end}} {{.Name}} = {{(plus1 $i)}}; {{end}}    
}
{{end}}
 

service {{.API.Name}}Service {
{{range .API.Operations}} {{ if or (eq $e.Operationid "Read") (eq $e.Operationid "ReadAll")  }}
    rpc {{.Operationid}}({{.Request}}) returns ({{.Response}}){
    }
{{end}}{{end}}

}