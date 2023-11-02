FROM golang:1.17 AS builder
WORKDIR /app
COPY . .

RUN go mod init github.com/fullcycle/aula-docker-go
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o app

FROM scratch
COPY --from=builder /app/app /app

CMD ["/app"]
