# Sentinel

[![Build Status][travis-svg]][travis-url]

Docker image for Sentinel.

> Sentinel is an autonomous agent for persisting, processing and automating [...] governance objects and tasks [...]
> https://github.com/dashpay/sentinel

## Usage
```
docker run lepetitbloc/sentinel
```

You should specify your configuration and the database directory as volumes:
```
docker run \
-v /home/crowdcoin/masternodes/mn01/.crowdcoincore/crowdcoin.conf:/sentinel/.dashcore/dash.conf
-v /home/crowdcoin/masternodes/mn01/sentinel/database:/sentinel/database
--network host
lepetitbloc/sentinel
```
> It can be tedious to configure sentinel to use a different `rpchost` than localhost, the easy path is to use `--network host`

### Environment variables
* `SENTINEL_DEBUG` either `1` or `0`
* `SENTINEL_CONFIG` path to the sentinel configuration file (`/sentinel/conf/sentinel.conf` by default)
* `LC_ALL` to overrides [localisation settings](https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html#Locale-Environment-Variables) (`C` by default, for default)

## Variants
The Dash Sentinel image should be compatible with most forks, but as configurations may vary here is a list of dedicated image variations:
* [`lepetitbloc/sentinel-sparks`](https://hub.docker.com/r/lepetitbloc/sentinel-sparks/) built from https://github.com/sparkscrypto/sentinel
* [`lepetitbloc/sentinel-crowdcoin`](https://hub.docker.com/r/lepetitbloc/sentinel-crowdcoin/) built from https://github.com/crowdcoinChain/sentinelLinux
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

## Troubleshooting
>**\[Errno 104] Connection reset by peer**  \
> *or*  \
>**\[Errno 32] Broken pipe** *with Python 3.\**  \
> *or*  \
>**BadStatusLine** *with Python 2.\**

In any of these cases, it means the server hang-up on you. You reach the server and your credentials are probably right but your IP might not be allowed.
Change the value of `rpcallowip`.
> :pushpin: Don't forget you can add more than one `rpcallowip` line in your configuration file.

## Authors
Originally inspired by [@phpgeekfr](https://github.com/phpgeekfr) & [@Phylante](https://github.com/Phylante)

[travis-svg]: https://travis-ci.org/LePetitBloc/sentinel.svg?branch=master
[travis-url]: https://travis-ci.org/LePetitBloc/sentinel
