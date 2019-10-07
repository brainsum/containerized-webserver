#!/usr/bin/env bash

COMPOSE_FILES="-f docker-compose.yml"

if [[ -f "docker-compose.build.yml" ]]; then
  COMPOSE_FILES="${COMPOSE_FILES} -f docker-compose.build.yml"
fi

echo "Using compose files: ${COMPOSE_FILES}"

# DOCKER_BUILDKIT=1 is only available in docker 18.09 and newer.
# Maybe add `{ "features": { "buildkit": true } }` to `/etc/docker/daemon.json`.
# COMPOSE_DOCKER_CLI_BUILD=1 will be available in compose 1.25 probably.
docker-compose ${COMPOSE_FILES} build --force-rm
