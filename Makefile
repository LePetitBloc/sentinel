all: build-all test-all push-all

install:
	curl -fsSL https://goss.rocks/install | sh

build:
	docker build -t lepetitbloc/sentinel .

build-all: build
	docker build --build-arg REPOSITORY=https://github.com/crowdcoinChain/sentinelLinux.git --build-arg CONFIG_PATH=/sentinel/.crowdcoincore/crowdcoin.conf -t lepetitbloc/sentinel-crowdcoin .
	docker build --build-arg REPOSITORY=https://github.com/sparkscrypto/sentinel.git -t lepetitbloc/sentinel-sparks .

test:
	dgoss run lepetitbloc/sentinel

test-all: test
	dgoss run lepetitbloc/sentinel-crowdcoin
	dgoss run lepetitbloc/sentinel-sparks

push:
	docker push lepetitbloc/sentinel

push-all: push
	docker push lepetitbloc/sentinel-crowdcoin
	docker push lepetitbloc/sentinel-sparks