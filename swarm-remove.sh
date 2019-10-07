#!/usr/bin/env bash

stackName="proxy"

echo "Removing stack: ${stackName}"

docker stack rm --orchestrator swarm ${stackName}
