<xml version="1.0" encoding="UTF-8">

<databaseChangeLog
        xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext"
        xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd
        http://www.liquibase.org/xml/ns/dbchangelog-ext http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd">

    <preConditions>
        <runningAs username="liquibase"/>
    </preConditions>

{{$DomainModel := .DomainModels.DomainModel}}

{{range  $j, $f := $DomainModel}}
    <changeSet id="{{$j}}" author="gogenetic">
        <createTable tableName="{{$f.Name}}">
			{{range  $k, $g := $f.Variable}}
				<column name="{{$g.Name}}" type="{{$g.Dbtype}}" >
					
				</column>
			{{end}}
        </createTable>
    </changeSet>
{{end}}
  

</databaseChangeLog>
