#!/bin/bash

docker-volume-mapping.sh
docker-dev-env.sh
docker-build-images.sh
concourse-dev-env.sh

docker compose --file docker-compose.yml --project-name dev-env --env-file .env up --build -d