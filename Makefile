IMAGE_LINT = microparts/docker-golang-lint
IMAGE_TEST = microparts/docker-golang-test
IMAGE_BUILD = microparts/docker-golang-build
IMAGE_BASE = microparts/docker-golang-base
VERSION_LINT = 1.0.1
VERSION_TEST = 1.0.2
VERSION_BUILD = 1.1.1
VERSION_BASE = 1.0.2
GOLANGCI_VERSION = v1.24.0

build-lint-image:
	cp ./.golangci.yml ./1.12/lint/
	cp ./.golangci.yml ./1.13/lint/
	cp ./.golangci.yml ./1.14/lint/
	docker build -f ./1.12/lint/Dockerfile --build-arg GOLANGCI_VERSION=$(GOLANGCI_VERSION) -t $(IMAGE_LINT):go-1.12-$(VERSION_LINT) 1.12/lint/
	docker build -f ./1.13/lint/Dockerfile --build-arg GOLANGCI_VERSION=$(GOLANGCI_VERSION) -t $(IMAGE_LINT):go-1.13-$(VERSION_LINT) 1.13/lint/
	docker build -f ./1.14/lint/Dockerfile --build-arg GOLANGCI_VERSION=$(GOLANGCI_VERSION) -t $(IMAGE_LINT):go-1.14-$(VERSION_LINT) 1.14/lint/

build-test-image:
	docker build -f ./1.12/test/Dockerfile -t $(IMAGE_TEST):go-1.12-$(VERSION_TEST) .
	docker build -f ./1.13/test/Dockerfile -t $(IMAGE_TEST):go-1.13-$(VERSION_TEST) .
	docker build -f ./1.14/test/Dockerfile -t $(IMAGE_TEST):go-1.14-$(VERSION_TEST) .

build-build-image:
	docker build -f ./1.12/build/Dockerfile -t $(IMAGE_BUILD):go-1.12-$(VERSION_BUILD) .
	docker build -f ./1.13/build/Dockerfile -t $(IMAGE_BUILD):go-1.13-$(VERSION_BUILD) .
	docker build -f ./1.14/build/Dockerfile -t $(IMAGE_BUILD):go-1.14-$(VERSION_BUILD) .

build-base-image:
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):go-1.12-$(VERSION_BASE) .
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):go-1.13-$(VERSION_BASE) .
	docker build -f ./base/Dockerfile -t $(IMAGE_BASE):go-1.14-$(VERSION_BASE) .

build-all: build-lint-image build-test-image build-build-image build-base-image

push-lint-image:
	docker push $(IMAGE_LINT):go-1.12-$(VERSION_LINT)
	docker tag $(IMAGE_LINT):go-1.12-$(VERSION_LINT) $(IMAGE_LINT):go-1.12-latest
	docker push $(IMAGE_LINT):go-1.12-latest
	docker push $(IMAGE_LINT):go-1.13-$(VERSION_LINT)
	docker tag $(IMAGE_LINT):go-1.13-$(VERSION_LINT) $(IMAGE_LINT):go-1.13-latest
	docker push $(IMAGE_LINT):go-1.13-latest
	docker push $(IMAGE_LINT):go-1.14-$(VERSION_LINT)
	docker tag $(IMAGE_LINT):go-1.14-$(VERSION_LINT) $(IMAGE_LINT):go-1.14-latest
	docker push $(IMAGE_LINT):go-1.14-latest

push-test-image:
	docker push $(IMAGE_TEST):go-1.12-$(VERSION_TEST)
	docker tag $(IMAGE_TEST):go-1.12-$(VERSION_TEST) $(IMAGE_TEST):go-1.12-latest
	docker push $(IMAGE_TEST):go-1.12-latest
	docker push $(IMAGE_TEST):go-1.13-$(VERSION_TEST)
	docker tag $(IMAGE_TEST):go-1.13-$(VERSION_TEST) $(IMAGE_TEST):go-1.13-latest
	docker push $(IMAGE_TEST):go-1.13-latest
	docker push $(IMAGE_TEST):go-1.14-$(VERSION_TEST)
	docker tag $(IMAGE_TEST):go-1.14-$(VERSION_TEST) $(IMAGE_TEST):go-1.14-latest
	docker push $(IMAGE_TEST):go-1.14-latest

push-build-image:
	docker push $(IMAGE_BUILD):go-1.12-$(VERSION_BUILD)
	docker tag $(IMAGE_BUILD):go-1.12-$(VERSION_BUILD) $(IMAGE_BUILD):go-1.12-latest
	docker push $(IMAGE_BUILD):go-1.12-latest
	docker push $(IMAGE_BUILD):go-1.13-$(VERSION_BUILD)
	docker tag $(IMAGE_BUILD):go-1.13-$(VERSION_BUILD) $(IMAGE_BUILD):go-1.13-latest
	docker push $(IMAGE_BUILD):go-1.13-latest
	docker push $(IMAGE_BUILD):go-1.14-$(VERSION_BUILD)
	docker tag $(IMAGE_BUILD):go-1.14-$(VERSION_BUILD) $(IMAGE_BUILD):go-1.14-latest
	docker push $(IMAGE_BUILD):go-1.14-latest

push-base-image:
	docker push $(IMAGE_BASE):go-1.12-$(VERSION_BASE)
	docker tag $(IMAGE_BASE):go-1.12-$(VERSION_BASE) $(IMAGE_BASE):go-1.12-latest
	docker push $(IMAGE_BASE):go-1.12-latest
	docker push $(IMAGE_BASE):go-1.13-$(VERSION_BASE)
	docker tag $(IMAGE_BASE):go-1.13-$(VERSION_BASE) $(IMAGE_BASE):go-1.13-latest
	docker push $(IMAGE_BASE):go-1.13-latest
	docker push $(IMAGE_BASE):go-1.14-$(VERSION_BASE)
	docker tag $(IMAGE_BASE):go-1.14-$(VERSION_BASE) $(IMAGE_BASE):go-1.14-latest
	docker push $(IMAGE_BASE):go-1.14-latest

push-all: push-lint-image push-test-image push-build-image push-base-image

all: build-all push-all