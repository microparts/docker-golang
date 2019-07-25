FROM golang:1.12-alpine

ARG GOLANGCI_VERSION

RUN apk update && apk upgrade \
 && apk add git gcc libc-dev \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/* \
 && wget -O - -q https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s ${GOLANGCI_VERSION} \
 && golangci-lint --version

WORKDIR /app

COPY .golangci.yml /app

CMD ["golangci-lint", "run"]