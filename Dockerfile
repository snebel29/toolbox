FROM golang:1.12 as builder
LABEL maintainer="Sven Nebel <https://github.com/snebel29>"

WORKDIR /go/src/github.com/snebel29/toolbox
COPY http_server.go .
RUN go build http_server.go


FROM ubuntu:18.04

RUN apt update -y && \
    apt install -y \
	curl \
	netcat \
	iputils-ping \
	tcpdump net-tools \
	lsof \
	traceroute \
	mtr && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /go/src/github.com/snebel29/toolbox/http_server /bin
CMD bash

