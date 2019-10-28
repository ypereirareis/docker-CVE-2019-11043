FROM golang:1.13.3-alpine3.10

MAINTAINER Yannick Pereira-Reis <yannick.pereira.reis@gmail.com>

# Need git to install github repo
RUN apk add --no-cache \
    git

# Get the CVE-2019-11043 check script
RUN go get github.com/neex/phuip-fpizdam

ENTRYPOINT ["phuip-fpizdam"]
CMD ["-h"]
