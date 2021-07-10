# Build stage
# Current go-shadowsocks2 version v0.1.5
FROM golang:alpine AS builder

ENV GO111MODULE on

RUN apk -U upgrade --no-cache \
    && apk add git --no-cache \
    && go get -u -v github.com/shadowsocks/go-shadowsocks2

# Final stage
FROM alpine:latest
RUN apk -U upgrade --no-cache
WORKDIR /app
COPY --from=builder /go/bin/go-shadowsocks2 /app/
ENTRYPOINT go-shadowsocks2 -s "ss://${SS_METHOD}:${SS_PASSWORD}@:8989"
