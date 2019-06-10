FROM golang

ENV GO111MODULE=on

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
COPY --from=builder /{{.Architechture.Outputdir}} /app
EXPOSE 8080
ENTRYPOINT ["{{.Architechture.Outputdir}}"]