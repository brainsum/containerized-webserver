#!/bin/sh

if ! nginx -t > /dev/null 2>&1
then
  echo "The nginx configuration is invalid."

  nginx -t

  exit 1
fi

nginx -g "daemon off;"
