IMAGE_LINT = microparts/docker-golang-lint
IMAGE_TEST = microparts/docker-golang-test
IMAGE_BUILD = microparts/docker-golang-build
IMAGE_BASE = microparts/docker-golang-base
VERSION_LINT = 1.0.0
VERSION_TEST = 1.0.1
VERSION_BUILD = 1.0.1
VERSION_BASE = 1.0.1
GOLANGCI_VERSION = v1.17.1

build-lint-image:
	docker build -f ./lint/Dockerfile --build-arg GOLANGCI_VERSION=$(GOLANGCI_VERSION) -t $(IMAGE_LINT):$(VERSION_LINT) lint

build-test-image:
	docker build -f ./test/Dockerfile -t $(IMAGE_TEST):$(VERSION_TEST) .

build-build-image:
	docker build -f ./build/Dockerfile -t $(IMAGE_BUILD):$(VERSION_BUILD) .

build-base-image:
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):$(VERSION_BASE) .

build-all: build-lint-image build-test-image build-build-image build-base-image

push-lint-image:
	docker push $(IMAGE_LINT):$(VERSION_LINT)
	docker tag $(IMAGE_LINT):$(VERSION_LINT) $(IMAGE_LINT):latest
	docker push $(IMAGE_LINT):latest

push-test-image:
	docker push $(IMAGE_TEST):$(VERSION_TEST)
	docker tag $(IMAGE_TEST):$(VERSION_TEST) $(IMAGE_TEST):latest
	docker push $(IMAGE_TEST):latest

push-build-image:
	docker push $(IMAGE_BUILD):$(VERSION_BUILD)
	docker tag $(IMAGE_BUILD):$(VERSION_BUILD) $(IMAGE_BUILD):latest
	docker push $(IMAGE_BUILD):latest

push-base-image:
	docker push $(IMAGE_BASE):$(VERSION_BASE)
	docker tag $(IMAGE_BASE):$(VERSION_BASE) $(IMAGE_BASE):latest
	docker push $(IMAGE_BASE):latest

push-all: push-lint-image push-test-image push-build-image push-base-image

all: build-all push-all