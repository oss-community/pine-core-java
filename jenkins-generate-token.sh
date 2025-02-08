#!/bin/bash

# Generate more api tokens
JENKINS_URL=$(cat ./secrets/jenkinsurl)
JENKINS_USER=$(cat ./secrets/jenkinsuser)
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

CRUMB=$(curl -s -u $JENKINS_USER:$JENKINS_API_TOKEN "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb' | tr -d '\r')
curl -s -u $JENKINS_USER:$JENKINS_API_TOKEN -H "Jenkins-Crumb:$CRUMB" -X POST "$JENKINS_URL/me/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken?newTokenName=admin_token" | jq
