FROM golang:1.12.1-alpine
MAINTAINER Sergey Gladkovskiy <smgladkovskiy@gmail.com>

RUN apk update \
 && apk add --no-cache \
    curl \
    git \
    make \
    openssh-client \
    tzdata \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/* \
 && mkdir /root/.ssh/

WORKDIR /app