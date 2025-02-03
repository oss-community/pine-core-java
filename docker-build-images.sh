#!/bin/bash

docker build -t $DOCKER_USERNAME/jenkins:latest ./docker/jenkins/ --no-cache
#docker push $DOCKER_USERNAME/jenkins:latest
docker build -t $DOCKER_USERNAME/openjdk17:latest ./docker/openjdk17/ --no-cache
#docker push $DOCKER_USERNAME/openjdk17:latest
docker build -t $DOCKER_USERNAME/pine-alpine:latest ./docker/pinealpine/ --no-cache
#docker push $DOCKER_USERNAME/pine-alpine:latest
