# Build stage
# Current go-shadowsocks2 version v0.0.11
FROM golang:alpine AS builder

RUN apk upgrade --update
RUN apk add git
RUN go get -u -v github.com/shadowsocks/go-shadowsocks2



# Final stage
FROM alpine:latest
RUN apk upgrade --update \
    && apk add bash tzdata \
RUN rm -rf /var/cache/apk/*

WORKDIR /app
COPY --from=builder /go/bin/go-shadowsocks2 /app/
ENTRYPOINT ["./go-shadowsocks2"]
