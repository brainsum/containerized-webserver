# Containerized Web Server

[![](https://images.microbadger.com/badges/image/brainsum/containerized-webserver.svg)](https://microbadger.com/images/brainsum/containerized-webserver "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/brainsum/containerized-webserver.svg)](https://microbadger.com/images/brainsum/containerized-webserver "Get your own version badge on microbadger.com")

## About

General web server/proxy for containerized environments.

## Note

Currently, this repo is set up for nginx deployed in a docker swarm for Node.JS apps.

# Setup

- Copy the example docker-compose files in the root folder as non-example versions and change the values as needed.
    - E.g `example.docker-compose.local.yml` should be `docker-compose.local.yml`
- Copy `docker/dev-site.nginx.conf` to `config/site.nginx.conf` and update it as needed.
    - Note, for localhost dev sites this should be OK without a change.
- Generate a `config/dhparam.pem` file
    - `mkdir -p config`
    - `openssl dhparam -dsaparam -out config/dhparam.pem 4096`
- Execute the following:
    - Notes:
        - These have to be executed initially, and every time any of these files change. Otherwise swarm is not going to pick up changes in these.
        - Export is used, but you may want to copy/paste the configs and secrets to `docker-compose.local.yml` and overwrite like that (e.g when needing to deploy dev/stage/prod on the same machine)
        - Adding multiple sites should be done with the same method, but you should use different config files.
    - `export PROXY_DHPARAM_VERSION=$(md5sum config/dhparam.pem | tr ' ' '\n' | head -1)`

## Adding services

In the rest of services you want to join, add them to the `proxy_default`.
You should also add a unique alias to your service.

Note: In case swarm creates the network with a different name, not `proxy_default`, use that network instead.

E.g:

```yaml
version: "3.7"

services:
  app:
    networks:
      proxy_default:
        aliases:
          - dev-backend

networks:
  proxy_default:
    external: true
```
