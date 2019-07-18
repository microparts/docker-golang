FROM golang:1.12
MAINTAINER Sergey Gladkovskiy <smgladkovskiy@gmail.com>

RUN apt update \
 && apt upgrade -y \
 && apt install -y \
    curl \
    gcc \
    git \
    make \
    openssh-client \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app