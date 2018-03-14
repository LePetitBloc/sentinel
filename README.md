# Sentinel
Sentinel Dockerfile.

## Usage
```
docker run lepetitbloc/sentinel
```

## Compatible core Wallets
Sentinel is compatible with some **Dash** core forks:
* [Sparks](https://github.com/lepetitbloc/sparksd)
* [Crowdcoin](https://hub.docker.com/r/lepetitbloc/crowdcoind/)
* ...

## Changelog
* Use `develop` branch of [dashpay/sentinel](https://github.com/dashpay/sentinel) for now, to allow usage of the `rpchost` config key (@see [#31](https://github.com/dashpay/sentinel/pull/31))
* Use the Dash generic implementation of Sentinel.

## Resources
* https://github.com/dashpay/sentinel

## Development
1. Build the and tag the image:
```
docker build -t lepetitbloc/sentinel .
```

2. Test the container:
> The container is tested using `dgoss` from [goss](https://github.com/aelsabbahy/goss):
```
curl -fsSL https://goss.rocks/install | sh
dgoss run lepetitbloc/sentinel
```

## Authors
Originally inspired by [@phpgeekfr](https://github.com/phpgeekfr) & [@Phylante](https://github.com/Phylante)
