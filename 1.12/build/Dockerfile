FROM golang:1.12-alpine

RUN apk update && apk upgrade \
 && apk add --no-cache \
    curl \
    gcc \
    git \
    make \
    musl-dev \
    openssh-client \
    tzdata \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/*

WORKDIR /app