#!/bin/bash

GITHUB_USERNAME=$(cat ./secrets/githubusername) # samanalishiri
GITHUB_EMAIL=$(cat ./secrets/githubemail) # samanalishiri@gmail.com
GITHUB_REPOSITORY_ACCESS_TOKEN=$(cat ./secrets/githubrepositoryaccesstoken)
GITHUB_PACKAGE_TOKEN=$(cat ./secrets/githubpackagetoken)
GITHUB_ARTIFACTORY_URL=$(cat ./secrets/githubartifactoryurl) # oss-community/pine-core-java
DOCKER_USERNAME=$(cat ./secrets/dockerusername) # samanalishiri
SONAR_TOKEN=$(cat ./secrets/sonartoken)
SONAR_URL=$(cat ./secrets/sonarurl) # http://sonarqube:9000/
SONAR_DB=$(cat ./secrets/sonardb) # sonar
SONAR_DB_USER=$(cat ./secrets/sonardbuser) # sonar_user
SONAR_DB_PASSWORD=$(cat ./secrets/sonardbpassword) # sonar_pass
SONAR_JDBC_URL=$(cat ./secrets/sonarjdbcurl) # jdbc:postgresql://sonarqube-db:5432/sonar
JFROG_ARTIFACTORY_USERNAME=$(cat ./secrets/jfrogartifactoryusername) # admin
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$(cat ./secrets/jfrogtoken)
JFROG_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/jfrogartifactorysnapshoturl) # http://jfrog:8081/artifactory/pine-libs-snapshot/
JFROG_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/jfrogartifactoryreleaseurl) # http://jfrog:8081/artifactory/pine-libs-release/
JFROG_ARTIFACTORY_CONTEXT_URL=$(cat ./secrets/jfrogartifactorycontexturl) # http://jfrog:8082/artifactory/
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$(cat ./secrets/jfrogartifactoryrepositoryprefix) # pine
JFROG_DB=$(cat ./secrets/jfrogdb) # artifactory
JFROG_DB_USER=$(cat ./secrets/jfrogdbuser) # artifactory_user
JFROG_DB_PASSWORD=$(cat ./secrets/jfrogdbpassword) # artifactory_pass
JF_SHARED_DATABASE_TYPE=$(cat ./secrets/jfshareddatabasetype) # postgresql
JF_SHARED_DATABASE_DRIVER=$(cat ./secrets/jfshareddatabasedriver) # "org.postgresql.Driver"
JF_SHARED_DATABASE_URL=$(cat ./secrets/jfshareddatabaseurl) # jdbc:postgresql://jfrog-db:5432/artifactory
NEXUS_ARTIFACTORY_USERNAME=$(cat ./secrets/nexusartifactoryusername) # admin
NEXUS_ARTIFACTORY_PASSWORD=$(cat ./secrets/nexustoken)
NEXUS_ARTIFACTORY_HOST_URL=$(cat ./secrets/nexusartifactoryhosturl) # http://nexus:8081
NEXUS_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/nexusartifactorysnapshoturl) # http://nexus:8081/repository/maven-snapshots/
NEXUS_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/nexusartifactoryreleaseurl) # http://nexus:8081/repository/maven-releases/
JENKINS_URL=$(cat ./secrets/jenkinsurl) # http://jenkins:8080
JENKINS_USER=$(cat ./secrets/jenkinsuser) # admin
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

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

mkdir -p ./ci/docker_compose/jenkins \
./ci/docker_compose/jfrog-postgresql \
./ci/docker_compose/jfrog \
./ci/docker_compose/nexus/nexus-data \
./ci/docker_compose/sonarqube-postgresql \
./ci/docker_compose/sonarqube/sonarqube_data \
./ci/docker_compose/sonarqube/sonarqube_extensions \
./ci/docker_compose/sonarqube/sonarqube_logs \
|| true

docker build -t $DOCKER_USERNAME/jenkins:latest ./docker/jenkins/ --no-cache
docker build -t $DOCKER_USERNAME/openjdk17:latest ./docker/openjdk17/ --no-cache
docker build -t $DOCKER_USERNAME/pine-alpine:latest ./docker/pinealpine/ --no-cache

docker compose --file jenkins-docker-compose.yml --project-name jenkins-dev --env-file .jenkins.env.dev up --build -d
