#!/bin/bash

read -rsn 1 -p "Press any key to continue after tools run successfully"

# sonar
echo "Sonar Config"
echo "Login $(cat ./secrets/sonarurl) and keep/change the default credentials to, for example 'admin/password'"
echo "default username: admin"
echo "default password: admin"
SONAR_URL=$(cat ./secrets/sonarurl)

read -p "Enter username [default: admin]: " sonarusername
SONAR_USERNAME=${sonarusername:-admin}
echo "$SONAR_USERNAME" > ./secrets/sonarusername

read -p "Enter new password [default: password]: " sonarpassword
SONAR_PASSWORD=${sonarpassword:-password}

curl -u "$SONAR_USERNAME:$SONAR_PASSWORD" -X POST "$SONAR_URL/api/user_tokens/revoke" -d "name=$SONAR_USERNAME"
SONAR_TOKEN=$(curl -u "$SONAR_USERNAME:$SONAR_PASSWORD" -X POST "$SONAR_URL/api/user_tokens/generate" -d "name=$SONAR_USERNAME"  | jq -r '.token' | tr -d '\r')
echo "$SONAR_TOKEN" > ./secrets/sonartoken

# jfrog
echo "JFrog Config"
echo "Login $(cat ./secrets/jfrogartifactorycontexturl) and keep/change the default credentials to, for example 'admin/password'"
echo "Create maven repository with $(cat ./secrets/jfrogartifactoryrepositoryprefix) prefix via Web UI in OSS version."
echo "default username: admin"
echo "default password: password"

ARTIFACTORY_URL="$(cat ./secrets/jfrogartifactorycontexturl)"

read -p "Enter username [default: admin]: " jfrogusername
JFROG_USERNAME=${jfrogusername:-admin}
echo "$JFROG_USERNAME" > ./secrets/jfrogartifactoryusername

read -p "Enter new password [default: password]: " jfrogpassword
JFROG_PASSWORD=${jfrogpassword:-password}

JFROG_ENCRYPTED_PASSWORD=$(curl -u "$JFROG_USERNAME:$JFROG_PASSWORD" -X GET "$ARTIFACTORY_URL/api/security/encryptedPassword")
echo "$JFROG_ENCRYPTED_PASSWORD" > ./secrets/jfrogtoken

# nexus
echo "Nexus Config"
echo "Login $(cat ./secrets/nexusartifactoryhosturl) and keep/change the default credentials to, for example 'admin/password'"
echo "Create maven repository with $(cat ./secrets/nexusartifactoryreleaseurl) and $(cat ./secrets/nexusartifactorysnapshoturl) via Web UI in OSS version. (Optional)"
echo "default username: admin"
DEFAULT_NEXUS_PASSWORD=$(cat ./ci/docker_compose/nexus/admin.password)
echo "default password: $DEFAULT_NEXUS_PASSWORD"

read -p "Enter username [default: admin]: " nexususername
NEXUS_USERNAME=${nexususername:-admin}
echo "$NEXUS_USERNAME" > ./secrets/nexusartifactoryusername

read -p "Enter new password [default: password]: " nexuspassword
NEXUS_PASSWORD=${nexuspassword:-password}
echo "$NEXUS_PASSWORD" > ./secrets/nexustoken