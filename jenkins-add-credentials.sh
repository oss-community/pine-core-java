#!/bin/bash

GITHUB_USERNAME=$(cat ./secrets/githubusername)
GITHUB_EMAIL=$(cat ./secrets/githubemail)
GITHUB_REPOSITORY_ACCESS_TOKEN=$(cat ./secrets/githubrepositoryaccesstoken)
GITHUB_PACKAGE_TOKEN=$(cat ./secrets/githubpackagetoken)
GITHUB_ARTIFACTORY_URL=$(cat ./secrets/githubartifactoryurl)
SONAR_TOKEN=$(cat ./secrets/sonartoken)
SONAR_URL=$(cat ./secrets/sonarurl)
JFROG_ARTIFACTORY_USERNAME=$(cat ./secrets/jfrogartifactoryusername)
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$(cat ./secrets/jfrogtoken)
JFROG_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/jfrogartifactorysnapshoturl)
JFROG_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/jfrogartifactoryreleaseurl)
JFROG_ARTIFACTORY_CONTEXT_URL=$(cat ./secrets/jfrogartifactorycontexturl)
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$(cat ./secrets/jfrogartifactoryrepositoryprefix)
NEXUS_ARTIFACTORY_USERNAME=$(cat ./secrets/nexusartifactoryusername)
NEXUS_ARTIFACTORY_PASSWORD=$(cat ./secrets/nexustoken)
NEXUS_ARTIFACTORY_HOST_URL=$(cat ./secrets/nexusartifactoryhosturl)
NEXUS_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/nexusartifactorysnapshoturl)
NEXUS_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/nexusartifactoryreleaseurl)
JENKINS_URL=$(cat ./secrets/jenkinsurl)
JENKINS_USER=$(cat ./secrets/jenkinsuser)
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

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
            "id": "GITHUB_JENKINS_USERNAME_PASSWORD",
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
