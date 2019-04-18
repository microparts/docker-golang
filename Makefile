IMAGE_BUILD = microparts/docker-golang-build
IMAGE_BASE = microparts/docker-golang-base
VERSION = latest

build-build-image:
	docker build -f ./build/Dockerfile -t $(IMAGE_BUILD):$(VERSION) .

build-base-image:
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):$(VERSION) .

build-all: build-build-image build-base-image

push-build-image:
	docker push $(IMAGE_BUILD):$(VERSION)

push-base-image:
	docker push $(IMAGE_BASE):$(VERSION)

push-all: push-build-image push-base-image

all: build-all push-all