#!/bin/bash

JENKINS_URL=$(cat ./secrets/jenkinsurl)
JENKINS_USER=$(cat ./secrets/jenkinsuser)
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

CRUMB=$(curl -s -u "$JENKINS_USER:$JENKINS_API_TOKEN" "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb' | tr -d '\r')

#curl -u "$JENKINS_USER:$JENKINS_API_TOKEN" "$JENKINS_URL/api/json" | jq
#curl -u "$JENKINS_USER:$JENKINS_API_TOKEN" "$JENKINS_URL/user/$JENKINS_USER/api/json" | jq
#curl -u "$JENKINS_USER:$JENKINS_API_TOKEN" "$JENKINS_URL/manage/configure"
#curl -u "$JENKINS_USER:$JENKINS_API_TOKEN" "$JENKINS_URL/authorizationStrategy/api/json?pretty=true"


curl -X POST "$JENKINS_URL/manage/configure" \
-u "$JENKINS_USER:$JENKINS_API_TOKEN" \
-H "Jenkins-Crumb:$CRUMB" \
-H "Content-Type: application/xml" \
--data-binary @./ci/jenkins/config.xml


#curl -X POST -u "$JENKINS_USER:$JENKINS_API_TOKEN" -H "Jenkins-Crumb:$CRUMB" "$JENKINS_URL/safeRestart"
