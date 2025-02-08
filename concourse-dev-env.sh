#!/bin/bash

echo "#credentials" > ./ci/concourse/credentials.yml

echo DOCKER_USERNAME: $DOCKER_USERNAME >> ./ci/concourse/credentials.yml

echo GITHUB_USER_NAME: $GITHUB_USERNAME >> ./ci/concourse/credentials.yml
echo GITHUB_USER_EMAIL: $GITHUB_EMAIL >> ./ci/concourse/credentials.yml
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

echo github_key_pub: >> ./ci/concourse/credentials.yml
echo github_key: '|' >> ./ci/concourse/credentials.yml

mkdir -p ./ci/concourse/keys
echo $GITHUB_REPOSITORY_ACCESS_TOKEN > githubrepositoryaccesstoken

ssh-keygen -t rsa -C "concourse_team" -f ./ci/concourse/keys/pipeline
gh auth login -p ssh -h github.com --with-token < githubrepositoryaccesstoken
gh repo deploy-key add ./ci/concourse/keys/pipeline.pub -R $GITHUB_ARTIFACTORY_URL -t concourse_team-key-pub -w

ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/session_signing_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/tsa_host_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/worker_key

mv ./ci/concourse/keys/worker_key.pub ./ci/concourse/keys/authorized_worker_keys

