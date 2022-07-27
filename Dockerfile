FROM golang:1.18 AS builder

WORKDIR /usr/src/app/

RUN go mod init cv/hello

COPY hello.go .

RUN go build -v -o /usr/local/bin/app ./

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

CMD ["app"]

