#!/bin/bash

read -rsn 1 -p "Press any key to continue after tools run successfully"

# sonar
echo "Sonar Config"
echo "Login $(cat ./secrets/SONAR_LOCALHOST_URL) and keep/change the default credentials to, for example 'admin/password'"
echo "default username: admin"
echo "default password: admin"
SONAR_URL=$(cat ./secrets/SONAR_LOCALHOST_URL)

read -p "Enter username [default: admin]: " SONAR_USERNAME
SONAR_USERNAME=${SONAR_USERNAME:-admin}
echo "$SONAR_USERNAME" > ./secrets/SONAR_USERNAME

read -p "Enter new password [default: password]: " sonarpassword
SONAR_PASSWORD=${sonarpassword:-password}

curl -u "$SONAR_USERNAME:$SONAR_PASSWORD" -X POST "$SONAR_URL/api/user_tokens/revoke" -d "name=$SONAR_USERNAME"
SONAR_TOKEN=$(curl -u "$SONAR_USERNAME:$SONAR_PASSWORD" -X POST "$SONAR_URL/api/user_tokens/generate" -d "name=$SONAR_USERNAME"  | jq -r '.token' | tr -d '\r')
echo "$SONAR_TOKEN" > ./secrets/SONAR_TOKEN

# jfrog
echo "JFrog Config"
echo "Login $(cat ./secrets/JFROG_ARTIFACTORY_CONTEXT__LOCALHOST_URL) and keep/change the default credentials to, for example 'admin/password'"
echo "Create maven repository with $(cat ./secrets/JFROG_ARTIFACTORY_REPOSITORY_PREFIX) prefix via Web UI in OSS version."
echo "default username: admin"
echo "default password: password"

ARTIFACTORY_URL="$(cat ./secrets/JFROG_ARTIFACTORY_CONTEXT__LOCALHOST_URL)"

read -p "Enter username [default: admin]: " jfrogusername
JFROG_USERNAME=${jfrogusername:-admin}
echo "$JFROG_USERNAME" > ./secrets/JFROG_ARTIFACTORY_USERNAME

read -p "Enter new password [default: password]: " jfrogpassword
JFROG_PASSWORD=${jfrogpassword:-password}

JFROG_ENCRYPTED_PASSWORD=$(curl -u "$JFROG_USERNAME:$JFROG_PASSWORD" -X GET "$ARTIFACTORY_URL/api/security/encryptedPassword")
echo "$JFROG_ENCRYPTED_PASSWORD" > ./secrets/JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD

# nexus
echo "Nexus Config"
echo "Login $(cat ./secrets/NEXUS_ARTIFACTORY_LOCALHOST_URL) and keep/change the default credentials to, for example 'admin/password'"
echo "Create maven repository with $(cat ./secrets/NEXUS_ARTIFACTORY_RELEASE_URL) and $(cat ./secrets/NEXUS_ARTIFACTORY_SNAPSHOT_URL) via Web UI in OSS version. (Optional)"
echo "default username: admin"
DEFAULT_NEXUS_PASSWORD=$(cat ./docker_compose/nexus/admin.password)
echo "default password: $DEFAULT_NEXUS_PASSWORD"

read -p "Enter username [default: admin]: " nexususername
NEXUS_USERNAME=${nexususername:-admin}
echo "$NEXUS_USERNAME" > ./secrets/NEXUS_ARTIFACTORY_USERNAME

read -p "Enter new password [default: password]: " nexuspassword
NEXUS_PASSWORD=${nexuspassword:-password}
echo "$NEXUS_PASSWORD" > ./secrets/NEXUS_TOKEN

# jenkins
echo "Jenkins Config"
echo "Login $(cat ./secrets/JENKINS_URL) and keep/change the default credentials to, for example 'admin/password'"
echo "Generate first API token via Web UI/Administrator/security"
echo "default username: admin"
JENKINS_DEFAULT_PASSWORD=$(cat ./docker_compose/jenkins/secrets/initialAdminPassword)
echo "default password: $JENKINS_DEFAULT_PASSWORD"

read -p "Enter username [default: admin]: " jenkinsusername
JENKINS_USERNAME=${jenkinsusername:-admin}
echo "$JENKINS_USERNAME" > ./secrets/JENKINS_USER

echo "Generate first API token via Web UI/Administrator/security"
read -p "Enter token [default: no default]: " jenkinstoken
JENKINS_TOKEN=$jenkinstoken
echo "$JENKINS_TOKEN" > ./secrets/JENKINS_TOKEN