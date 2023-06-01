FROM golang:alpine AS builder

RUN mkdir /app
COPY main.go /app

WORKDIR /app

RUN go get -d
RUN go build -o main .

FROM alpine
RUN apk update && apk add --no-cache ca-certificates

COPY --from=builder /app/main /main
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
