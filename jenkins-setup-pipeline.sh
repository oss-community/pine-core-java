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
JENKINS_URL=$(cat ./secrets/JENKINS_URL) # http://jenkins:8080
JENKINS_USER=$(cat ./secrets/JENKINS_USER) # admin
JENKINS_API_TOKEN=$(cat ./secrets/JENKINS_TOKEN)

echo "#ENV" > ./.jenkins.env.dev
echo DOCKER_USERNAME=$DOCKER_USERNAME >> ./.jenkins.env.dev
echo GITHUB_USERNAME=$GITHUB_USERNAME >> ./.jenkins.env.dev
echo GITHUB_EMAIL=$GITHUB_EMAIL >> ./.jenkins.env.dev
echo GITHUB_REPOSITORY_ACCESS_TOKEN=$GITHUB_REPOSITORY_ACCESS_TOKEN >> ./.jenkins.env.dev
echo GITHUB_PACKAGE_TOKEN=$GITHUB_PACKAGE_TOKEN >> ./.jenkins.env.dev
echo GITHUB_ARTIFACTORY_URL=$GITHUB_ARTIFACTORY_URL >> ./.jenkins.env.dev
echo SONAR_DB=$SONAR_DB >> ./.jenkins.env.dev
echo SONAR_DB_USER=$SONAR_DB_USER >> ./.jenkins.env.dev
echo SONAR_DB_PASSWORD=$SONAR_DB_PASSWORD >> ./.jenkins.env.dev
echo SONAR_JDBC_URL=$SONAR_JDBC_URL >> ./.jenkins.env.dev
echo JFROG_DB=$JFROG_DB >> ./.jenkins.env.dev
echo JFROG_DB_USER=$JFROG_DB_USER >> ./.jenkins.env.dev
echo JFROG_DB_PASSWORD=$JFROG_DB_PASSWORD >> ./.jenkins.env.dev
echo JF_SHARED_DATABASE_TYPE=$JF_SHARED_DATABASE_TYPE >> ./.jenkins.env.dev
echo JF_SHARED_DATABASE_DRIVER=$JF_SHARED_DATABASE_DRIVER >> ./.jenkins.env.dev
echo JF_SHARED_DATABASE_URL=$JF_SHARED_DATABASE_URL >> ./.jenkins.env.dev
echo CONCOURSE_DB=$CONCOURSE_DB >> ./.jenkins.env.dev
echo CONCOURSE_DB_HOST=CONCOURSE_DB_HOST >> ./.jenkins.env.dev
echo CONCOURSE_DB_PORT=$CONCOURSE_DB_PORT >> ./.jenkins.env.dev
echo CONCOURSE_DB_USER=$CONCOURSE_DB_USER >> ./.jenkins.env.dev
echo CONCOURSE_DB_PASSWORD=$CONCOURSE_DB_PASSWORD >> ./.jenkins.env.dev
echo CONCOURSE_EXTERNAL_URL=$CONCOURSE_EXTERNAL_URL >> ./.jenkins.env.dev
echo CONCOURSE_CLUSTER_NAME=$CONCOURSE_CLUSTER_NAME >> ./.jenkins.env.dev
echo CONCOURSE_ADD_LOCAL_USER=$CONCOURSE_ADD_LOCAL_USER >> ./.jenkins.env.dev
echo CONCOURSE_ADD_LOCAL_PASSWORD=$CONCOURSE_ADD_LOCAL_PASSWORD >> ./.jenkins.env.dev
echo CONCOURSE_MAIN_TEAM_LOCAL_USER=$CONCOURSE_MAIN_TEAM_LOCAL_USER >> ./.jenkins.env.dev
echo CONCOURSE_TSA_HOST=$CONCOURSE_TSA_HOST >> ./.jenkins.env.dev

mkdir -p ./docker_compose/jenkins \
./docker_compose/jfrog-postgresql \
./docker_compose/jfrog \
./docker_compose/nexus/nexus-data \
./docker_compose/sonarqube-postgresql \
./docker_compose/sonarqube/sonarqube_data \
./docker_compose/sonarqube/sonarqube_extensions \
./docker_compose/sonarqube/sonarqube_logs \
|| true

docker build -t $DOCKER_USERNAME/jenkins:latest ./docker/jenkins/ --no-cache

docker compose --file jenkins-docker-compose.yml --project-name jenkins-dev --env-file .jenkins.env.dev up --build -d
