{
  "swagger": "2.0",
  "info": {
    "title": "service.proto",
    "version": "version not set"
  },
  "schemes": [
    "http",
    "https"
  ],
  "consumes": [
    "application/json"
  ],
  "produces": [
    "application/json"
  ],
  "paths": {
 
 {{$apiname := .API.Name}}
 {{$n := len .API.Operations}}
 {{$n := (minus1 $n) }}   
 {{range  $i, $e := .API.Operations}}
   "{{$e.URL}}": {
      "{{$e.Protocol}}": {
        "operationId": "{{$e.Operationid}}",
        "responses": {
          "200": {
            "description": "A successful response.",
            "schema": {
              "$ref": "#/definitions/{{$e.Request}}"
            }
          }
        },
        "parameters": [
          {
            "name": "body",
            "in": "body",
            "required": true,
            "schema": {
              "$ref": "#/definitions/{{$e.Response}}"
            }
          }
        ],
        "tags": [
          "{{$apiname}}"
        ]
      }
    }
    {{if ne $i $n}} , {{end}}{{if eq (plus1 $i) $n}} {{end}}
{{end}}  
  }  ,
 
   
  "definitions": {
 {{$n := len .Models.Model}}
 {{$n := (minus1 $n) }}   
 {{range  $i, $e := .Models.Model}}
    "{{.Name}}": {
      "type": "object",
      "properties": {
        {{range .Variable}}  
        "{{.Name}}": {
          "type": "{{ (convertswagger .Type)}}",
        },
        {{end}}
      }
    }
    {{if ne $i $n}} , {{end}}{{if eq (plus1 $i) $n}} {{end}}
 {{end}} 
 }

}
