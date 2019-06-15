server.port = 9090
spring.application.name = {{.API.Name}}

spring.datasource.url=root:@tcp(localhost:3306)/GOGENETIC_SCHEMA?charset=utf8&parseTime=True&loc=Local
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.jdbc.Driver

spring.jpa.hibernate.ddl-auto=create
spring.jpa.database-platform=org.hibernate.dialect.MySQL57Dialect
spring.jpa.generate-ddl=true
spring.jpa.show-sql=true
