# Build stage
# Current go-shadowsocks2 version v0.0.11
FROM golang:1.11-alpine AS build-env

RUN apk upgrade --update
RUN apk add --no-cache --virtual build-depns git
RUN go get -u -v github.com/shadowsocks/go-shadowsocks2
ENV CGO_ENABLED=0
RUN apk del build-depns

# Final stage
FROM alpine:latest
RUN apk upgrade --update
RUN rm -rf /var/cache/apk/*

WORKDIR /app
COPY --from=build-env /go/bin/go-shadowsocks2 /app/
ENTRYPOINT ["./go-shadowsocks2"]
