FROM golang:1.12.7 AS builder
ENV GO111MODULE=on
WORKDIR /
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM alpine:3.10
WORKDIR /app
COPY --from=builder /{{.Architechture.Name}} .
COPY config-dev.json .
EXPOSE 8080
ENTRYPOINT ["/app/{{.Architechture.Name}}"]