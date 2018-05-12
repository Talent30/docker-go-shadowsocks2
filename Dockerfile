# Build stage
FROM golang:alpine AS build-env

RUN apk add --no-cache git
RUN go get -u -v github.com/shadowsocks/go-shadowsocks2

# Final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /go/bin/go-shadowsocks2 /app/
ENTRYPOINT ["./go-shadowsocks2"]
