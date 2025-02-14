#!/bin/bash

# GitHub Credentials
echo "export GITHUB_USERNAME='$(cat ./secrets/GITHUB_USERNAME)'" >> ${HOME}/.bashrc
echo "export GITHUB_EMAIL='$(cat ./secrets/GITHUB_EMAIL)'" >> ${HOME}/.bashrc
echo "export GITHUB_REPOSITORY_ACCESS_TOKEN='$(cat ./secrets/GITHUB_REPOSITORY_ACCESS_TOKEN)'" >> ${HOME}/.bashrc
echo "export GITHUB_PACKAGE_TOKEN='$(cat ./secrets/GITHUB_PACKAGE_TOKEN)'" >> ${HOME}/.bashrc
echo "export GITHUB_ARTIFACTORY_URL='$(cat ./secrets/GITHUB_ARTIFACTORY_URL)'" >> ${HOME}/.bashrc

# Docker Credentials
echo "export DOCKER_USERNAME='$(cat ./secrets/DOCKER_USERNAME)'" >> ${HOME}/.bashrc

# SonarQube Configuration
echo "export SONAR_TOKEN='$(cat ./secrets/SONAR_TOKEN)'" >> ${HOME}/.bashrc
echo "export SONAR_URL='$(cat ./secrets/SONAR_URL)'" >> ${HOME}/.bashrc
echo "export SONAR_DB='$(cat ./secrets/SONAR_DB)'" >> ${HOME}/.bashrc
echo "export SONAR_DB_USER='$(cat ./secrets/SONAR_DB_USER)'" >> ${HOME}/.bashrc
echo "export SONAR_DB_PASSWORD='$(cat ./secrets/SONAR_DB_PASSWORD)'" >> ${HOME}/.bashrc
echo "export SONAR_JDBC_URL='$(cat ./secrets/SONAR_DB_URL)'" >> ${HOME}/.bashrc

# JFrog Artifactory Configuration
echo "export JFROG_ARTIFACTORY_USERNAME='$(cat ./secrets/JFROG_ARTIFACTORY_USERNAME)'" >> ${HOME}/.bashrc
echo "export JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD='$(cat ./secrets/JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD)'" >> ${HOME}/.bashrc
echo "export JFROG_ARTIFACTORY_SNAPSHOT_URL='$(cat ./secrets/JFROG_ARTIFACTORY_SNAPSHOT_URL)'" >> ${HOME}/.bashrc
echo "export JFROG_ARTIFACTORY_RELEASE_URL='$(cat ./secrets/JFROG_ARTIFACTORY_RELEASE_URL)'" >> ${HOME}/.bashrc
echo "export JFROG_ARTIFACTORY_CONTEXT_URL='$(cat ./secrets/JFROG_ARTIFACTORY_CONTEXT_URL)'" >> ${HOME}/.bashrc
echo "export JFROG_ARTIFACTORY_REPOSITORY_PREFIX='$(cat ./secrets/JFROG_ARTIFACTORY_REPOSITORY_PREFIX)'" >> ${HOME}/.bashrc
echo "export JFROG_DB='$(cat ./secrets/JFROG_DB)'" >> ${HOME}/.bashrc
echo "export JFROG_DB_USER='$(cat ./secrets/JFROG_DB_USER)'" >> ${HOME}/.bashrc
echo "export JFROG_DB_PASSWORD='$(cat ./secrets/JFROG_DB_PASSWORD)'" >> ${HOME}/.bashrc
echo "export JF_SHARED_DATABASE_TYPE='$(cat ./secrets/JF_SHARED_DATABASE_TYPE)'" >> ${HOME}/.bashrc
echo "export JF_SHARED_DATABASE_DRIVER='$(cat ./secrets/JF_SHARED_DATABASE_DRIVER)'" >> ${HOME}/.bashrc
echo "export JF_SHARED_DATABASE_URL='$(cat ./secrets/JF_SHARED_DATABASE_URL)'" >> ${HOME}/.bashrc

# Nexus Repository Configuration
echo "export NEXUS_ARTIFACTORY_USERNAME='$(cat ./secrets/NEXUS_ARTIFACTORY_USERNAME)'" >> ${HOME}/.bashrc
echo "export NEXUS_ARTIFACTORY_PASSWORD='$(cat ./secrets/NEXUS_TOKEN)'" >> ${HOME}/.bashrc
echo "export NEXUS_ARTIFACTORY_HOST_URL='$(cat ./secrets/NEXUS_ARTIFACTORY_HOST_URL)'" >> ${HOME}/.bashrc
echo "export NEXUS_ARTIFACTORY_SNAPSHOT_URL='$(cat ./secrets/NEXUS_ARTIFACTORY_SNAPSHOT_URL)'" >> ${HOME}/.bashrc
echo "export NEXUS_ARTIFACTORY_RELEASE_URL='$(cat ./secrets/NEXUS_ARTIFACTORY_RELEASE_URL)'" >> ${HOME}/.bashrc

# Concourse CI Configuration
echo "export CONCOURSE_DB='$(cat ./secrets/CONCOURSE_DB)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_DB_HOST='$(cat ./secrets/CONCOURSE_DB_HOST)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_DB_PORT='$(cat ./secrets/CONCOURSE_DB_PORT)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_DB_USER='$(cat ./secrets/CONCOURSE_DB_USER)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_DB_PASSWORD='$(cat ./secrets/CONCOURSE_DB_PASSWORD)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_EXTERNAL_URL='$(cat ./secrets/CONCOURSE_EXTERNAL_URL)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_CLUSTER_NAME='$(cat ./secrets/CONCOURSE_CLUSTER_NAME)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_ADD_LOCAL_USER='$(cat ./secrets/CONCOURSE_ADD_LOCALUSER)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_ADD_LOCAL_PASSWORD='$(cat ./secrets/CONCOURSE_ADD_LOCALPASSWORD)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_MAIN_TEAM_LOCAL_USER='$(cat ./secrets/CONCOURSE_MAIN_TEAM_LOCALUSER)'" >> ${HOME}/.bashrc
echo "export CONCOURSE_TSA_HOST='$(cat ./secrets/CONCOURSE_TSA)'" >> ${HOME}/.bashrc

# Jenkins Configuration
echo "export JENKINS_URL='$(cat ./secrets/JENKINS_URL)'" >> ${HOME}/.bashrc
echo "export JENKINS_USER='$(cat ./secrets/JENKINS_USER)'" >> ${HOME}/.bashrc
echo "export JENKINS_API_TOKEN='$(cat ./secrets/JENKINS_TOKEN)'" >> ${HOME}/.bashrc

# Apply changes
source ${HOME}/.bashrc

echo "================================="
echo "== GitHub Credentials         =="
echo "================================="
echo "GITHUB_USERNAME=$GITHUB_USERNAME"
echo "GITHUB_EMAIL=$GITHUB_EMAIL"
echo "GITHUB_REPOSITORY_ACCESS_TOKEN=$GITHUB_REPOSITORY_ACCESS_TOKEN"
echo "GITHUB_PACKAGE_TOKEN=$GITHUB_PACKAGE_TOKEN"
echo "GITHUB_ARTIFACTORY_URL=$GITHUB_ARTIFACTORY_URL"

echo "================================="
echo "== Docker Credentials         =="
echo "================================="
echo "DOCKER_USERNAME=$DOCKER_USERNAME"

echo "================================="
echo "== SonarQube Configuration    =="
echo "================================="
echo "SONAR_TOKEN=$SONAR_TOKEN"
echo "SONAR_URL=$SONAR_URL"
echo "SONAR_DB=$SONAR_DB"
echo "SONAR_DB_USER=$SONAR_DB_USER"
echo "SONAR_DB_PASSWORD=$SONAR_DB_PASSWORD"
echo "SONAR_JDBC_URL=$SONAR_JDBC_URL"

echo "================================="
echo "== JFrog Artifactory Configuration =="
echo "================================="
echo "JFROG_ARTIFACTORY_USERNAME=$JFROG_ARTIFACTORY_USERNAME"
echo "JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD"
echo "JFROG_ARTIFACTORY_SNAPSHOT_URL=$JFROG_ARTIFACTORY_SNAPSHOT_URL"
echo "JFROG_ARTIFACTORY_RELEASE_URL=$JFROG_ARTIFACTORY_RELEASE_URL"
echo "JFROG_ARTIFACTORY_CONTEXT_URL=$JFROG_ARTIFACTORY_CONTEXT_URL"
echo "JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$JFROG_ARTIFACTORY_REPOSITORY_PREFIX"
echo "JFROG_DB=$JFROG_DB"
echo "JFROG_DB_USER=$JFROG_DB_USER"
echo "JFROG_DB_PASSWORD=$JFROG_DB_PASSWORD"
echo "JF_SHARED_DATABASE_TYPE=$JF_SHARED_DATABASE_TYPE"
echo "JF_SHARED_DATABASE_DRIVER=$JF_SHARED_DATABASE_DRIVER"
echo "JF_SHARED_DATABASE_URL=$JF_SHARED_DATABASE_URL"

echo "================================="
echo "== Nexus Repository Configuration =="
echo "================================="
echo "NEXUS_ARTIFACTORY_USERNAME=$NEXUS_ARTIFACTORY_USERNAME"
echo "NEXUS_ARTIFACTORY_PASSWORD=$NEXUS_ARTIFACTORY_PASSWORD"
echo "NEXUS_ARTIFACTORY_HOST_URL=$NEXUS_ARTIFACTORY_HOST_URL"
echo "NEXUS_ARTIFACTORY_SNAPSHOT_URL=$NEXUS_ARTIFACTORY_SNAPSHOT_URL"
echo "NEXUS_ARTIFACTORY_RELEASE_URL=$NEXUS_ARTIFACTORY_RELEASE_URL"

echo "================================="
echo "== Concourse CI Configuration  =="
echo "================================="
echo "CONCOURSE_DB=$CONCOURSE_DB"
echo "CONCOURSE_DB_HOST=$CONCOURSE_DB_HOST"
echo "CONCOURSE_DB_PORT=$CONCOURSE_DB_PORT"
echo "CONCOURSE_DB_USER=$CONCOURSE_DB_USER"
echo "CONCOURSE_DB_PASSWORD=$CONCOURSE_DB_PASSWORD"
echo "CONCOURSE_EXTERNAL_URL=$CONCOURSE_EXTERNAL_URL"
echo "CONCOURSE_CLUSTER_NAME=$CONCOURSE_CLUSTER_NAME"
echo "CONCOURSE_ADD_LOCAL_USER=$CONCOURSE_ADD_LOCAL_USER"
echo "CONCOURSE_ADD_LOCAL_PASSWORD=$CONCOURSE_ADD_LOCAL_PASSWORD"
echo "CONCOURSE_MAIN_TEAM_LOCAL_USER=$CONCOURSE_MAIN_TEAM_LOCAL_USER"
echo "CONCOURSE_TSA_HOST=$CONCOURSE_TSA_HOST"

echo "================================="
echo "== Jenkins Configuration       =="
echo "================================="
echo "JENKINS_URL=$JENKINS_URL"
echo "JENKINS_USER=$JENKINS_USER"
echo "JENKINS_API_TOKEN=$JENKINS_API_TOKEN"
