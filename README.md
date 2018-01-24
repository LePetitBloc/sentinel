# Sentinel
Dash (and forks) sentinel Docker container

> See https://github.com/blocksheep/sparks for a Sparks wallet docker container.

# Usage
```
docker build -t sentinel .
docker run sentinel
```

# Changelog
* Use `develop` branch of [dashpay/sentinel](https://github.com/dashpay/sentinel) for now, to allow usage of the `rpchost` config key (@see [#31](https://github.com/dashpay/sentinel/pull/31))
* Use the Dash generic implementation of Sentinel.

# Resources
* https://github.com/dashpay/sentinel

# Authors
Originally created by [@phpgeekfr](https://github.com/phpgeekfr) & [@Phylante](https://github.com/Phylante)
