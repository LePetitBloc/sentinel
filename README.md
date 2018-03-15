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

## Variants
The Dash Sentinel image should be compatible with most forks, but as configurations may vary here is a list of dedicated image variations:
* [`lepetitbloc/sentinel-sparks`](https://hub.docker.com/r/lepetitbloc/sentinel-sparks/) built from https://github.com/crowdcoinChain/sentinelLinux
* [`lepetitbloc/sentinel-crowdcoin`](https://hub.docker.com/r/lepetitbloc/sentinel-crowdcoin/) built from https://github.com/sparkscrypto/sentinel
* ...

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
