#!/bin/bash

GITHUB_USERNAME=$(cat ./secrets/GITHUB_USERNAME) # samanalishiri
GITHUB_EMAIL=$(cat ./secrets/GITHUB_EMAIL) # samanalishiri@gmail.com
GITHUB_REPOSITORY_ACCESS_TOKEN=$(cat ./secrets/GITHUB_REPOSITORY_ACCESS_TOKEN)
GITHUB_PACKAGE_TOKEN=$(cat ./secrets/GITHUB_PACKAGE_TOKEN)
GITHUB_ARTIFACTORY_URL=$(cat ./secrets/GITHUB_ARTIFACTORY_URL) # oss-community/pine-core-java
DOCKER_USERNAME=$(cat ./secrets/DOCKER_USERNAME) # samanalishiri
SONAR_TOKEN=$(cat ./secrets/SONAR_TOKEN)
SONAR_URL=$(cat ./secrets/SONAR_URL) # http://sonarqube:9000/
SONAR_DB=$(cat ./secrets/SONAR_DB) # sonar
SONAR_DB_USER=$(cat ./secrets/SONAR_DB_USER) # sonar_user
SONAR_DB_PASSWORD=$(cat ./secrets/SONAR_DB_PASSWORD) # sonar_pass
SONAR_JDBC_URL=$(cat ./secrets/SONAR_DB_URL) # jdbc:postgresql://sonarqube-db:5432/sonar
JFROG_ARTIFACTORY_USERNAME=$(cat ./secrets/JFROG_ARTIFACTORY_USERNAME) # admin
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$(cat ./secrets/JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD)
JFROG_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/JFROG_ARTIFACTORY_SNAPSHOT_URL) # http://jfrog:8081/artifactory/pine-libs-snapshot/
JFROG_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/JFROG_ARTIFACTORY_RELEASE_URL) # http://jfrog:8081/artifactory/pine-libs-release/
JFROG_ARTIFACTORY_CONTEXT_URL=$(cat ./secrets/JFROG_ARTIFACTORY_CONTEXT_URL) # http://jfrog:8082/artifactory/
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$(cat ./secrets/JFROG_ARTIFACTORY_REPOSITORY_PREFIX) # pine
JFROG_DB=$(cat ./secrets/JFROG_DB) # artifactory
JFROG_DB_USER=$(cat ./secrets/JFROG_DB_USER) # artifactory_user
JFROG_DB_PASSWORD=$(cat ./secrets/JFROG_DB_PASSWORD) # artifactory_pass
JF_SHARED_DATABASE_TYPE=$(cat ./secrets/JF_SHARED_DATABASE_TYPE) # postgresql
JF_SHARED_DATABASE_DRIVER=$(cat ./secrets/JF_SHARED_DATABASE_DRIVER) # "org.postgresql.Driver"
JF_SHARED_DATABASE_URL=$(cat ./secrets/JF_SHARED_DATABASE_URL) # jdbc:postgresql://jfrog-db:5432/artifactory
NEXUS_ARTIFACTORY_USERNAME=$(cat ./secrets/NEXUS_ARTIFACTORY_USERNAME) # admin
NEXUS_ARTIFACTORY_PASSWORD=$(cat ./secrets/NEXUS_TOKEN)
NEXUS_ARTIFACTORY_HOST_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_HOST_URL) # http://nexus:8081
NEXUS_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_SNAPSHOT_URL) # http://nexus:8081/repository/maven-snapshots/
NEXUS_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_RELEASE_URL) # http://nexus:8081/repository/maven-releases/
CONCOURSE_DB=$(cat ./secrets/CONCOURSE_DB) # concourse
CONCOURSE_DB_HOST=$(cat ./secrets/CONCOURSE_DB_HOST) # concourse-db
CONCOURSE_DB_PORT=$(cat ./secrets/CONCOURSE_DB_PORT) # 5432
CONCOURSE_DB_USER=$(cat ./secrets/CONCOURSE_DB_USER) # concourse_user
CONCOURSE_DB_PASSWORD=$(cat ./secrets/CONCOURSE_DB_PASSWORD) # concourse_pass
CONCOURSE_EXTERNAL_URL=$(cat ./secrets/CONCOURSE_EXTERNAL_URL) # http://localhost:8083
CONCOURSE_CLUSTER_NAME=$(cat ./secrets/CONCOURSE_CLUSTER_NAME) # pineframework
CONCOURSE_ADD_LOCAL_USER=$(cat ./secrets/CONCOURSE_ADD_LOCALUSER) # pine
CONCOURSE_ADD_LOCAL_PASSWORD=$(cat ./secrets/CONCOURSE_ADD_LOCALPASSWORD) # pine
CONCOURSE_MAIN_TEAM_LOCAL_USER=$(cat ./secrets/CONCOURSE_MAIN_TEAM_LOCALUSER) # pine
CONCOURSE_TSA_HOST=$(cat ./secrets/CONCOURSE_TSA) # concourse-web:2222

echo "#ENV" > ./.concourse.env.dev
echo DOCKER_USERNAME=$DOCKER_USERNAME >> ./.concourse.env.dev
echo GITHUB_USERNAME=$GITHUB_USERNAME >> ./.concourse.env.dev
echo GITHUB_EMAIL=$GITHUB_EMAIL >> ./.concourse.env.dev
echo GITHUB_REPOSITORY_ACCESS_TOKEN=$GITHUB_REPOSITORY_ACCESS_TOKEN >> ./.concourse.env.dev
echo GITHUB_PACKAGE_TOKEN=$GITHUB_PACKAGE_TOKEN >> ./.concourse.env.dev
echo GITHUB_ARTIFACTORY_URL=$GITHUB_ARTIFACTORY_URL >> ./.concourse.env.dev
echo SONAR_DB=$SONAR_DB >> ./.concourse.env.dev
echo SONAR_DB_USER=$SONAR_DB_USER >> ./.concourse.env.dev
echo SONAR_DB_PASSWORD=$SONAR_DB_PASSWORD >> ./.concourse.env.dev
echo SONAR_JDBC_URL=$SONAR_JDBC_URL >> ./.concourse.env.dev
echo JFROG_DB=$JFROG_DB >> ./.concourse.env.dev
echo JFROG_DB_USER=$JFROG_DB_USER >> ./.concourse.env.dev
echo JFROG_DB_PASSWORD=$JFROG_DB_PASSWORD >> ./.concourse.env.dev
echo JF_SHARED_DATABASE_TYPE=$JF_SHARED_DATABASE_TYPE >> ./.concourse.env.dev
echo JF_SHARED_DATABASE_DRIVER=$JF_SHARED_DATABASE_DRIVER >> ./.concourse.env.dev
echo JF_SHARED_DATABASE_URL=$JF_SHARED_DATABASE_URL >> ./.concourse.env.dev
echo CONCOURSE_DB=$CONCOURSE_DB >> ./.concourse.env.dev
echo CONCOURSE_DB_HOST=CONCOURSE_DB_HOST >> ./.concourse.env.dev
echo CONCOURSE_DB_PORT=$CONCOURSE_DB_PORT >> ./.concourse.env.dev
echo CONCOURSE_DB_USER=$CONCOURSE_DB_USER >> ./.concourse.env.dev
echo CONCOURSE_DB_PASSWORD=$CONCOURSE_DB_PASSWORD >> ./.concourse.env.dev
echo CONCOURSE_EXTERNAL_URL=$CONCOURSE_EXTERNAL_URL >> ./.concourse.env.dev
echo CONCOURSE_CLUSTER_NAME=$CONCOURSE_CLUSTER_NAME >> ./.concourse.env.dev
echo CONCOURSE_ADD_LOCAL_USER=$CONCOURSE_ADD_LOCAL_USER >> ./.concourse.env.dev
echo CONCOURSE_ADD_LOCAL_PASSWORD=$CONCOURSE_ADD_LOCAL_PASSWORD >> ./.concourse.env.dev
echo CONCOURSE_MAIN_TEAM_LOCAL_USER=$CONCOURSE_MAIN_TEAM_LOCAL_USER >> ./.concourse.env.dev
echo CONCOURSE_TSA_HOST=$CONCOURSE_TSA_HOST >> ./.concourse.env.dev

echo "#credentials" > ./ci/concourse/credentials.yml
echo DOCKER_USERNAME: $DOCKER_USERNAME >> ./ci/concourse/credentials.yml
echo GITHUB_USERNAME: $GITHUB_USERNAME >> ./ci/concourse/credentials.yml
echo GITHUB_EMAIL: $GITHUB_EMAIL >> ./ci/concourse/credentials.yml
echo GITHUB_PACKAGE_TOKEN: $GITHUB_PACKAGE_TOKEN >> ./ci/concourse/credentials.yml
echo GITHUB_ARTIFACTORY_URL: $GITHUB_ARTIFACTORY_URL >> ./ci/concourse/credentials.yml
echo SONAR_TOKEN: $SONAR_TOKEN >> ./ci/concourse/credentials.yml
echo SONAR_URL: $SONAR_URL >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_USERNAME: $JFROG_ARTIFACTORY_USERNAME >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD: $JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_SNAPSHOT_URL: $JFROG_ARTIFACTORY_SNAPSHOT_UR >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_RELEASE_URL: $JFROG_ARTIFACTORY_RELEASE_UR >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_CONTEXT_URL: $JFROG_ARTIFACTORY_CONTEXT_URL >> ./ci/concourse/credentials.yml
echo JFROG_ARTIFACTORY_REPOSITORY_PREFIX: $JFROG_ARTIFACTORY_REPOSITORY_PREFIX >> ./ci/concourse/credentials.yml
echo NEXUS_ARTIFACTORY_USERNAME: $NEXUS_ARTIFACTORY_USERNAME >> ./ci/concourse/credentials.yml
echo NEXUS_ARTIFACTORY_PASSWORD: $NEXUS_ARTIFACTORY_PASSWORD >> ./ci/concourse/credentials.yml
echo NEXUS_ARTIFACTORY_HOST_URL: $NEXUS_ARTIFACTORY_HOST_URL >> ./ci/concourse/credentials.yml
echo NEXUS_ARTIFACTORY_SNAPSHOT_URL: $NEXUS_ARTIFACTORY_SNAPSHOT_URL >> ./ci/concourse/credentials.yml
echo NEXUS_ARTIFACTORY_RELEASE_URL: $NEXUS_ARTIFACTORY_RELEASE_URL >> ./ci/concourse/credentials.yml

mkdir -p ./docker_compose/concourse-postgresql \
./ci/concourse/keys \
./docker_compose/jfrog-postgresql \
./docker_compose/jfrog \
./docker_compose/nexus/nexus-data \
./docker_compose/sonarqube-postgresql \
./docker_compose/sonarqube/sonarqube_data \
./docker_compose/sonarqube/sonarqube_extensions \
./docker_compose/sonarqube/sonarqube_logs \
|| true

ssh-keygen -t rsa -C "concourse_team" -f ./ci/concourse/keys/concourse_key
gh auth login -p ssh -h github.com --with-token < GITHUB_REPOSITORY_ACCESS_TOKEN
gh repo deploy-key add ./ci/concourse/keys/concourse_key.pub -R $GITHUB_ARTIFACTORY_URL -t concourse_team_key_PUB -w
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/session_signing_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/tsa_host_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/worker_key
mv ./ci/concourse/keys/worker_key.pub ./ci/concourse/keys/authorized_worker_keys

echo GITHUB_KEY_PUB: '|' >> ./ci/concourse/credentials.yml
cat ./ci/concourse/keys/concourse_key.pub | sed 's/^/  /' >> ./ci/concourse/credentials.yml

echo GITHUB_KEY: '|' >> ./ci/concourse/credentials.yml
cat ./ci/concourse/keys/concourse_key | sed 's/^/  /' >> ./ci/concourse/credentials.yml

docker compose --file concourse-docker-compose.yml --project-name concourse-dev --env-file .concourse.env.dev up --build -d

docker build -t $DOCKER_USERNAME/openjdk17:latest ./docker/openjdk17/ --no-cache
docker push $DOCKER_USERNAME/openjdk17:latest
