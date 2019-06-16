FROM java:8-jdk-alpine

COPY ./target/{{.API.Name}}-1.0.0-SNAPSHOT.jar /usr/app/

WORKDIR /usr/app

RUN sh -c 'touch {{.API.Name}}-1.0.0-SNAPSHOT.jar'

ENTRYPOINT ["java","-jar","{{.API.Name}}-1.0.0-SNAPSHOT.jar"]