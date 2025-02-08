#!/bin/bash

JENKINS_URL=$(cat ./secrets/jenkinsurl)
JENKINS_USER=$(cat ./secrets/jenkinsuser)
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

CRUMB=$(curl -s -u $JENKINS_USER:$JENKINS_API_TOKEN "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb' | tr -d '\r')

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_USERNAME/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_EMAIL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_REPOSITORY_ACCESS_TOKEN/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_PACKAGE_TOKEN/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_REPOSITORY_USERNAME_PASSWORD/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/GITHUB_ARTIFACTORY_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/SONAR_TOKEN/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/SONAR_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_USERNAME/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_SNAPSHOT_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_RELEASE_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_CONTEXT_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/JFROG_ARTIFACTORY_REPOSITORY_PREFIX/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/NEXUS_ARTIFACTORY_USERNAME/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/NEXUS_ARTIFACTORY_PASSWORD/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/NEXUS_ARTIFACTORY_HOST_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/NEXUS_ARTIFACTORY_SNAPSHOT_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"

curl -s -v -X POST "$JENKINS_URL/credentials/store/system/domain/_/credential/NEXUS_ARTIFACTORY_RELEASE_URL/doDelete" \
  -u "$JENKINS_USER:$JENKINS_API_TOKEN" \
  -H "Jenkins-Crumb:$CRUMB"
