#!/bin/bash

GITHUB_USERNAME=$(cat ./secrets/GITHUB_USERNAME)
GITHUB_EMAIL=$(cat ./secrets/GITHUB_EMAIL)
GITHUB_REPOSITORY_ACCESS_TOKEN=$(cat ./secrets/GITHUB_REPOSITORY_ACCESS_TOKEN)
GITHUB_PACKAGE_TOKEN=$(cat ./secrets/GITHUB_PACKAGE_TOKEN)
GITHUB_ARTIFACTORY_URL=$(cat ./secrets/GITHUB_ARTIFACTORY_URL)
SONAR_TOKEN=$(cat ./secrets/SONAR_TOKEN)
SONAR_URL=$(cat ./secrets/SONAR_URL)
JFROG_ARTIFACTORY_USERNAME=$(cat ./secrets/JFROG_ARTIFACTORY_USERNAME)
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$(cat ./secrets/JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD)
JFROG_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/JFROG_ARTIFACTORY_SNAPSHOT_URL)
JFROG_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/JFROG_ARTIFACTORY_RELEASE_URL)
JFROG_ARTIFACTORY_CONTEXT_URL=$(cat ./secrets/JFROG_ARTIFACTORY_CONTEXT_URL)
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$(cat ./secrets/JFROG_ARTIFACTORY_REPOSITORY_PREFIX)
NEXUS_ARTIFACTORY_USERNAME=$(cat ./secrets/NEXUS_ARTIFACTORY_USERNAME)
NEXUS_ARTIFACTORY_PASSWORD=$(cat ./secrets/NEXUS_TOKEN)
NEXUS_ARTIFACTORY_HOST_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_HOST_URL)
NEXUS_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_SNAPSHOT_URL)
NEXUS_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/NEXUS_ARTIFACTORY_RELEASE_URL)
JENKINS_URL=$(cat ./secrets/JENKINS_URL)
JENKINS_USER=$(cat ./secrets/JENKINS_USER)
JENKINS_API_TOKEN=$(cat ./secrets/JENKINS_TOKEN)

CRUMB=$(curl -s -u $JENKINS_USER:$JENKINS_API_TOKEN "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb' | tr -d '\r')

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_USERNAME",
            "secret": "'"$GITHUB_USERNAME"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_EMAIL",
            "secret": "'"$GITHUB_EMAIL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_REPOSITORY_ACCESS_TOKEN",
            "secret": "'"$GITHUB_REPOSITORY_ACCESS_TOKEN"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_PACKAGE_TOKEN",
            "secret": "'"$GITHUB_PACKAGE_TOKEN"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_REPOSITORY_USERNAME_PASSWORD",
            "username": "'"$GITHUB_USERNAME"'",
            "password": "'"$GITHUB_REPOSITORY_ACCESS_TOKEN"'",
            "description": "Added via Rest API",
            "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "GITHUB_ARTIFACTORY_URL",
            "secret": "'"$GITHUB_ARTIFACTORY_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "SONAR_TOKEN",
            "secret": "'"$SONAR_TOKEN"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "SONAR_URL",
            "secret": "'"$SONAR_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_USERNAME",
            "secret": "'"$JFROG_ARTIFACTORY_USERNAME"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD",
            "secret": "'"$JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'


curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_SNAPSHOT_URL",
            "secret": "'"$JFROG_ARTIFACTORY_SNAPSHOT_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_RELEASE_URL",
            "secret": "'"$JFROG_ARTIFACTORY_RELEASE_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_CONTEXT_URL",
            "secret": "'"$JFROG_ARTIFACTORY_CONTEXT_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "JFROG_ARTIFACTORY_REPOSITORY_PREFIX",
            "secret": "'"$JFROG_ARTIFACTORY_REPOSITORY_PREFIX"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "NEXUS_ARTIFACTORY_USERNAME",
            "secret": "'"$NEXUS_ARTIFACTORY_USERNAME"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "NEXUS_ARTIFACTORY_PASSWORD",
            "secret": "'"$NEXUS_ARTIFACTORY_PASSWORD"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "NEXUS_ARTIFACTORY_HOST_URL",
            "secret": "'"$NEXUS_ARTIFACTORY_HOST_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'
curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "NEXUS_ARTIFACTORY_SNAPSHOT_URL",
            "secret": "'"$NEXUS_ARTIFACTORY_SNAPSHOT_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/createCredentials" \
    -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
    -H "Jenkins-Crumb:$CRUMB" \
    --data-urlencode 'json={
        "credentials": {
            "scope": "GLOBAL",
            "id": "NEXUS_ARTIFACTORY_RELEASE_URL",
            "secret": "'"$NEXUS_ARTIFACTORY_RELEASE_URL"'",
            "description": "Added via Rest API",
            "$class": "org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl"
        }
    }'
