#!/bin/bash

./docker-pre-config.sh
./docker-create-env.sh
./concourse-generate-credentials.sh

./docker-build-image-openjdk17.sh
./docker-build-image-jenkins.sh
./docker-build-image-nexus.sh
./docker-build-image-pinealpine.sh

docker-compose --file ./docker/docker-compose.yml --project-name pine-pipeline --env-file ./docker/.env up --build -d