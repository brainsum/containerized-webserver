#!/usr/bin/env bash

stackName="proxy"

COMPOSE_FILES="-c docker-compose.yml"

if [[ -f "docker-compose.local.yml" ]]; then
  COMPOSE_FILES="${COMPOSE_FILES} -c docker-compose.local.yml"
fi

echo "Deploying stack: ${stackName}"
echo "Using compose files: ${COMPOSE_FILES}"

docker stack deploy --orchestrator swarm ${COMPOSE_FILES} ${stackName}
