#!/bin/sh

if ! wget localhost:8080/health -q -O - > /dev/null 2>&1
then
  echo "Health-check failed, server is not running."
  exit 1
fi
