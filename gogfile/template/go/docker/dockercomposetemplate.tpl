version: '3.7'
services:
  db:
    container_name: db
    image: mysql:8
    restart: always
    ports:
      - 3306:3306
    env_file:
      - ./sql/db.env
    volumes:
      - ./sql/GOGENETIC_SCHEMA.sql:/docker-entrypoint-initdb.d/GOGENETIC_SCHEMA.sql
  ms-{{.Architechture.Name}}:
    build: ./{{.Architechture.Name}}
    image: {{.Architechture.Name}}:v0.1
    ports:
      - "8080:8080"