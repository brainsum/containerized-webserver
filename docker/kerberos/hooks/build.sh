#!/bin/sh
docker build --build-arg BASE_IMAGE_TAG=$BASE_IMAGE_TAG -t $IMAGE_NAME .
