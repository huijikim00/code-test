FROM golang:alpine AS builder

RUN mkdir /app
RUN apk update && apk add --no-cache git
COPY main.go /app

WORKDIR /app

RUN go get -d
RUN go build -o main .

FROM alpine
RUN apk update && apk add --no-cache ca-certificates

COPY --from=builder /app/main /main
CMD ["/main"]
