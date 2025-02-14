#!/bin/bash

create_secret() {
    local message=$1
    local var_name=$2
    local default_value=$3
    local user_input

    read -p "Enter $message [default: $default_value]: " user_input
    user_input=${user_input:-$default_value}
    echo "$user_input" > ./secrets/"$var_name"
}

# GitHub Variables
create_secret "GitHub username" "GITHUB_USERNAME" "samanalishiri"
create_secret "GitHub email" "GITHUB_EMAIL" "samanalishiri@gmail.com"
create_secret "GitHub repository access token" "GITHUB_REPOSITORY_ACCESS_TOKEN" "***"
create_secret "GitHub package token" "GITHUB_PACKAGE_TOKEN" "***"
create_secret "GitHub Artifactory URL" "GITHUB_ARTIFACTORY_URL" "oss-community/pine-core-java"

# Docker Variables
create_secret "Docker username" "DOCKER_USERNAME" "samanalishiri"

# Sonar Variables
create_secret "Sonar token" "SONAR_TOKEN" "***"
create_secret "Sonar URL" "SONAR_URL" "http://sonarqube:9000"
create_secret "Sonar URL for localhost" "SONAR_LOCALHOST_URL" "http://localhost:9000"
create_secret "Sonar database" "SONAR_DB" "sonar"
create_secret "Sonar database user" "SONAR_DB_USER" "sonar_user"
create_secret "Sonar database password" "SONAR_DB_PASSWORD" "sonar_pass"
create_secret "Sonar JDBC URL" "SONAR_DB_URL" "jdbc:postgresql://sonarqube-db:5432/sonar"

# JFrog Variables
create_secret "JFrog Artifactory username" "JFROG_ARTIFACTORY_USERNAME" "admin"
create_secret "JFrog token" "JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD" "***"
create_secret "JFrog Artifactory snapshot URL" "JFROG_ARTIFACTORY_SNAPSHOT_URL" "http://jfrog:8081/artifactory/pine-libs-snapshot"
create_secret "JFrog Artifactory release URL" "JFROG_ARTIFACTORY_RELEASE_URL" "http://jfrog:8081/artifactory/pine-libs-release"
create_secret "JFrog Artifactory context URL" "JFROG_ARTIFACTORY_CONTEXT_URL" "http://jfrog:8082/artifactory"
create_secret "JFrog Artifactory context URL for localhost" "JFROG_ARTIFACTORY_CONTEXT__LOCALHOST_URL" "http://localhost:8082/artifactory"
create_secret "JFrog Artifactory repository prefix" "JFROG_ARTIFACTORY_REPOSITORY_PREFIX" "pine"
create_secret "JFrog database" "JFROG_DB" "artifactory"
create_secret "JFrog database user" "JFROG_DB_USER" "artifactory_user"
create_secret "JFrog database password" "JFROG_DB_PASSWORD" "artifactory_pass"
create_secret "JFrog shared database type" "JF_SHARED_DATABASE_TYPE" "postgresql"
create_secret "JFrog shared database driver" "JF_SHARED_DATABASE_DRIVER" "org.postgresql.Driver"
create_secret "JFrog shared database URL" "JF_SHARED_DATABASE_URL" "jdbc:postgresql://jfrog-db:5432/artifactory"

# Nexus Variables
create_secret "Nexus Artifactory username" "NEXUS_ARTIFACTORY_USERNAME" "admin"
create_secret "Nexus token" "NEXUS_TOKEN" "***"
create_secret "Nexus Artifactory host URL" "NEXUS_ARTIFACTORY_HOST_URL" "http://nexus:8081"
create_secret "Nexus Artifactory host URL for localhost" "NEXUS_ARTIFACTORY_LOCALHOST_URL" "http://localhost:8084"
create_secret "Nexus Artifactory snapshot URL" "NEXUS_ARTIFACTORY_SNAPSHOT_URL" "http://nexus:8081/repository/maven-snapshots"
create_secret "Nexus Artifactory release URL" "NEXUS_ARTIFACTORY_RELEASE_URL" "http://nexus:8081/repository/maven-releases"

# Concourse Variables
create_secret "Concourse database" "CONCOURSE_DB" "concourse"
create_secret "Concourse database host" "CONCOURSE_DB_HOST" "concourse-db"
create_secret "Concourse database port" "CONCOURSE_DB_PORT" "5432"
create_secret "Concourse database user" "CONCOURSE_DB_USER" "concourse_user"
create_secret "Concourse database password" "CONCOURSE_DB_PASSWORD" "concourse_pass"
create_secret "Concourse external URL" "CONCOURSE_EXTERNAL_URL" "http://localhost:8083"
create_secret "Concourse cluster name" "CONCOURSE_CLUSTER_NAME" "pineframework"
create_secret "Concourse local user" "CONCOURSE_ADD_LOCALUSER" "pine"
create_secret "Concourse local user password" "CONCOURSE_ADD_LOCALPASSWORD" "pine"
create_secret "Concourse main team local user" "CONCOURSE_MAIN_TEAM_LOCALUSER" "pine"
create_secret "Concourse TSA host" "CONCOURSE_TSA" "concourse-web:2222"
