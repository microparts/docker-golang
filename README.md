This repo is **DEPRECATED**. Use https://github.com/spacetab-io/docker-images-golang instead.

docker-golang
-------------

Images for docker containers:

* [Lint environment](lint) container is for lint golang app source code. 
Uses [golangci-lint](https://github.com/golangci/golangci-lint) to lint code with [custom config](lint/.golangci.yml). 
* [Test environment](test) container is for testing golang app. Has all things to test golang sources with `go test`. 
* [Build environment](build) container is for building golang app. Has all things to build golang app with go modules. 
* [Base environment](base) container is for running golang app. Has all things to run binaries in formalized application 
structure. Exposes `8080` port and run service command: `/app/bin/service`. Only thing you must do is copy binaries, 
Makefile (if needed), migrations (if needed) and application default configuration.

## Usage

Common usage application Dockerfile:

```dockerfile
FROM microparts/docker-golang-lint:latest as lint-env

COPY . /app
RUN make lint

# ----

FROM microparts/docker-golang-test:latest as test-env

# copy downloaded deps
COPY --from=lint-env ${GOPATH}/pkg/mod ${GOPATH}/pkg/mod

COPY . /app
RUN make test

# ----

FROM microparts/docker-golang-build:latest as build-env

# copy downloaded deps
COPY --from=lint-env ${GOPATH}/pkg/mod ${GOPATH}/pkg/mod

COPY . /app
RUN make all

# ----

FROM microparts/docker-golang-base:latest

COPY --from=build-env /app/bin/*                  /app/bin/
COPY --from=build-env /app/Makefile               /app/
COPY --from=build-env /app/migrations/*           /app/migrations/
COPY --from=build-env /app/configuration/defaults /app/configuration/defaults
```

If private packages are used, build it with Dockerfile below and command: 
`docker build -t <imagename>:<tag> --build-arg TOKEN="$(cat ~/.ci-token)" --build-arg PRIVATE_REPO="private.repo.url" .`

```dockerfile
FROM microparts/docker-golang-test:latest as test-env

ARG TOKEN
ARG PRIVATE_REPO
RUN git config --global url."https://ci-token:${TOKEN}@${PRIVATE_REPO}/".insteadOf 'https://${PRIVATE_REPO}/'

COPY . /app
RUN make test
```
