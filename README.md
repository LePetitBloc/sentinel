# Sentinel

[![Build Status][travis-svg]][travis-url]

Docker image for Sentinel.

> Sentinel is an autonomous agent for persisting, processing and automating [...] governance objects and tasks [...]
> https://github.com/dashpay/sentinel

## Usage
```
docker run lepetitbloc/sentinel
```

### Environment variables
* `SENTINEL_DEBUG` either `1` or `0`
* `SENTINEL_CONFIG` path to the sentinel configuration file (`/sentinel/conf/sentinel.conf` by default)
* `LC_ALL` to overrides [localisation settings](https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html#Locale-Environment-Variables) (`C` by default, for default)

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
1. Build and tag the image:
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

[travis-svg]: https://travis-ci.org/LePetitBloc/sentinel.svg?branch=master
[travis-url]: https://travis-ci.org/LePetitBloc/sentinel
