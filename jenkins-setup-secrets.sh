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
create_secret "GitHub username" "githubusername" "samanalishiri"
create_secret "GitHub email" "githubemail" "samanalishiri@gmail.com"
create_secret "GitHub repository access token" "githubrepositoryaccesstoken" "***"
create_secret "GitHub package token" "githubpackagetoken" "***"
create_secret "GitHub Artifactory URL" "githubartifactoryurl" "oss-community/pine-core-java"

# Docker Variables
create_secret "Docker username" "dockerusername" "samanalishiri"

# Sonar Variables
create_secret "Sonar token" "sonartoken" "***"
create_secret "Sonar URL" "sonarurl" "http://sonarqube:9000"
create_secret "Sonar URL for localhost" "sonarurlforlocalhost" "http://localhost:9000"
create_secret "Sonar database" "sonardb" "sonar"
create_secret "Sonar database user" "sonardbuser" "sonar_user"
create_secret "Sonar database password" "sonardbpassword" "sonar_pass"
create_secret "Sonar JDBC URL" "sonarjdbcurl" "jdbc:postgresql://sonarqube-db:5432/sonar"

# JFrog Variables
create_secret "JFrog Artifactory username" "jfrogartifactoryusername" "admin"
create_secret "JFrog token" "jfrogtoken" "***"
create_secret "JFrog Artifactory snapshot URL" "jfrogartifactorysnapshoturl" "http://jfrog:8081/artifactory/pine-libs-snapshot"
create_secret "JFrog Artifactory release URL" "jfrogartifactoryreleaseurl" "http://jfrog:8081/artifactory/pine-libs-release"
create_secret "JFrog Artifactory context URL" "jfrogartifactorycontexturl" "http://jfrog:8082/artifactory"
create_secret "JFrog Artifactory context URL for localhost" "jfrogartifactorycontexturlforlocalhost" "http://localhost:8082/artifactory"
create_secret "JFrog Artifactory repository prefix" "jfrogartifactoryrepositoryprefix" "pine"
create_secret "JFrog database" "jfrogdb" "artifactory"
create_secret "JFrog database user" "jfrogdbuser" "artifactory_user"
create_secret "JFrog database password" "jfrogdbpassword" "artifactory_pass"
create_secret "JFrog shared database type" "jfshareddatabasetype" "postgresql"
create_secret "JFrog shared database driver" "jfshareddatabasedriver" "org.postgresql.Driver"
create_secret "JFrog shared database URL" "jfshareddatabaseurl" "jdbc:postgresql://jfrog-db:5432/artifactory"

# Nexus Variables
create_secret "Nexus Artifactory username" "nexusartifactoryusername" "admin"
create_secret "Nexus token" "nexustoken" "***"
create_secret "Nexus Artifactory host URL" "nexusartifactoryhosturl" "http://nexus:8081"
create_secret "Nexus Artifactory host URL for localhost" "nexusartifactoryhosturlforlocalhost" "http://localhost:8084"
create_secret "Nexus Artifactory snapshot URL" "nexusartifactorysnapshoturl" "http://nexus:8081/repository/maven-snapshots"
create_secret "Nexus Artifactory release URL" "nexusartifactoryreleaseurl" "http://nexus:8081/repository/maven-releases"

# Jenkins Variables
create_secret "Jenkins URL" "jenkinsurl" "http://localhost:8080"
create_secret "Jenkins user" "jenkinsuser" "admin"
create_secret "Jenkins API token" "jenkinstoken" "***"

