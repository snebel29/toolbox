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

CMD bash

