#!/bin/bash

docker --version
docker-compose --version
docker-machine --version

mkdir -p ./ci/docker_compose/jenkins \
./ci/docker_compose/jfrog-postgresql \
./ci/docker_compose/jfrog \
./ci/docker_compose/nexus/nexus-data \
./ci/docker_compose/concourse-postgresql \
./ci/docker_compose/concourse/keys \
./ci/docker_compose/sonarqube-postgresql \
./ci/docker_compose/sonarqube/sonarqube_data \
./ci/docker_compose/sonarqube/sonarqube_extensions \
./ci/docker_compose/sonarqube/sonarqube_logs || true

sudo sysctl -w vm.max_map_count=262144