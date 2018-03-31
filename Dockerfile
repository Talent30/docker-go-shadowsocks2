FROM golang:alpine

RUN apk add --no-cache git
RUN go get -u -v github.com/shadowsocks/go-shadowsocks2

ENTRYPOINT ["/go/bin/go-shadowsocks2"]
