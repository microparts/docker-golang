FROM golang:1.12
MAINTAINER Sergey Gladkovskiy <smgladkovskiy@gmail.com>

RUN apt-get update && apt-get upgrade -y \
 && go get -u golang.org/x/lint/golint \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app