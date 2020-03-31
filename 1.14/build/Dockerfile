FROM golang:1.14-alpine

RUN apk update && apk upgrade \
 && apk add --no-cache \
    curl \
    git \
    make \
    openssh-client \
    tzdata \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/*

WORKDIR /app