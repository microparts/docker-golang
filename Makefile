IMAGE_TEST = microparts/docker-golang-test
IMAGE_BUILD = microparts/docker-golang-build
IMAGE_BASE = microparts/docker-golang-base
VERSION = 1.0.0

build-test-image:
	docker build -f ./test/Dockerfile -t $(IMAGE_TEST):$(VERSION) .

build-build-image:
	docker build -f ./build/Dockerfile -t $(IMAGE_BUILD):$(VERSION) .

build-base-image:
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):$(VERSION) .

build-all: build-test-image build-build-image build-base-image

push-test-image:
	docker push $(IMAGE_TEST):$(VERSION)
	docker tag $(IMAGE_TEST):$(VERSION) $(IMAGE_TEST):latest
	docker push $(IMAGE_TEST):latest

push-build-image:
	docker push $(IMAGE_BUILD):$(VERSION)
	docker tag $(IMAGE_BUILD):$(VERSION) $(IMAGE_BUILD):latest
	docker push $(IMAGE_BUILD):latest

push-base-image:
	docker push $(IMAGE_BASE):$(VERSION)
	docker tag $(IMAGE_BASE):$(VERSION) $(IMAGE_BASE):latest
	docker push $(IMAGE_BASE):latest

push-all: push-test-image push-build-image push-base-image

all: build-all push-all