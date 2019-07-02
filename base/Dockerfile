FROM alpine
MAINTAINER Sergey Gladkovskiy <smgladkovskiy@gmail.com>

RUN apk update \
 && apk add --no-cache \
    ca-certificates \
    make \
    tzdata \
    curl \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/*

WORKDIR /app

EXPOSE 8080

CMD ["/app/bin/service"]
