# docker-go-shadowsocks2

Provides a dockerfile for a shadowsocks server based on the go-shadowsocks2 implementation of shadowsocks (https://shadowsocks.org).

It uses the go-shadowsocks2 binary as entrypoint.

## Usage

```
docker run --rm -p 8443:8443 -p 8443:8443/udp asoberlin/go-shadowsocks2 -cipher AES-256-CFB -password YOUR_PASSWORD -verbose -s :8443
```

The following options are available:

```
Usage of /go/bin/go-shadowsocks2:
  -c string
    	client connect address or url
  -cipher string
    	available ciphers: AEAD_AES_128_GCM AEAD_AES_192_GCM AEAD_AES_256_GCM AEAD_CHACHA20_POLY1305 AES-128-CFB AES-128-CTR AES-192-CFB AES-192-CTR AES-256-CFB AES-256-CTR CHACHA20-IETF XCHACHA20 (default "AEAD_CHACHA20_POLY1305")
  -key string
    	base64url-encoded key (derive from password if empty)
  -keygen int
    	generate a base64url-encoded random key of given length in byte
  -password string
    	password
  -redir string
    	(client-only) redirect TCP from this address
  -redir6 string
    	(client-only) redirect TCP IPv6 from this address
  -s string
    	server listen address or url
  -socks string
    	(client-only) SOCKS listen address
  -tcptun string
    	(client-only) TCP tunnel (laddr1=raddr1,laddr2=raddr2,...)
  -u	(client-only) Enable UDP support for SOCKS
  -udptimeout duration
    	UDP tunnel timeout (default 5m0s)
  -udptun string
    	(client-only) UDP tunnel (laddr1=raddr1,laddr2=raddr2,...)
  -verbose
    	verbose mode
```

