#!/bin/bash

docker-volume-mapping.sh
docker-dev.sh
docker-build-images.sh
concourse-dev.sh

docker compose --file docker-compose.yml --project-name dev --env-file .env up --build -d