FROM alpine

RUN apk update && apk upgrade \
 && apk add --no-cache \
    ca-certificates \
    curl \
    make \
    tzdata \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/*

WORKDIR /app

EXPOSE 8080

CMD ["/app/bin/service"]
