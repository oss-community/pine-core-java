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
create_secret "githubusername" "samanalishiri"
create_secret "githubemail" "samanalishiri@gmail.com"
create_secret "githubrepositoryaccesstoken" "***"
create_secret "githubpackagetoken" "***"
create_secret "githubartifactoryurl" "oss-community/pine-core-java"

# Docker Variables
create_secret "dockerusername" "samanalishiri"

# Sonar Variables
create_secret "sonartoken" "***"
create_secret "sonarurl" "http://sonarqube:9000/"
create_secret "sonardb" "sonar"
create_secret "sonardbuser" "sonar_user"
create_secret "sonardbpassword" "sonar_pass"
create_secret "sonarjdbcurl" "jdbc:postgresql://sonarqube-db:5432/sonar"

# JFrog Variables
create_secret "jfrogartifactoryusername" "admin"
create_secret "jfrogtoken" "***"
create_secret "jfrogartifactorysnapshoturl" "http://jfrog:8081/artifactory/pine-libs-snapshot/"
create_secret "jfrogartifactoryreleaseurl" "http://jfrog:8081/artifactory/pine-libs-release/"
create_secret "jfrogartifactorycontexturl" "http://jfrog:8082/artifactory/"
create_secret "jfrogartifactoryrepositoryprefix" "pine"
create_secret "jfrogdb" "artifactory"
create_secret "jfrogdbuser" "artifactory_user"
create_secret "jfrogdbpassword" "artifactory_pass"
create_secret "jfshareddatabasetype" "postgresql"
create_secret "jfshareddatabasedriver" '"org.postgresql.Driver"'
create_secret "jfshareddatabaseurl" "jdbc:postgresql://jfrog-db:5432/artifactory"

# Nexus Variables
create_secret "nexusartifactoryusername" "admin"
create_secret "nexustoken" "***"
create_secret "nexusartifactoryhosturl" "http://nexus:8081"
create_secret "nexusartifactorysnapshoturl" "http://nexus:8081/repository/maven-snapshots/"
create_secret "nexusartifactoryreleaseurl" "http://nexus:8081/repository/maven-releases/"

# Concourse Variables
create_secret "Concourse database" "concoursedb" "concourse"
create_secret "Concourse database host" "concoursedbhost" "concourse-db"
create_secret "Concourse database port" "concoursedbport" "5432"
create_secret "Concourse database user" "concoursedbuser" "concourse_user"
create_secret "Concourse database password" "concoursedbpassword" "concourse_pass"
create_secret "Concourse external URL" "concourseexternalurl" "http://localhost:8083"
create_secret "Concourse cluster name" "concourseclustername" "pineframework"
create_secret "Concourse local user" "concourseaddlocaluser" "pine"
create_secret "Concourse local user password" "concourseaddlocalpassword" "pine"
create_secret "Concourse main team local user" "concoursemainteamlocaluser" "pine"
create_secret "Concourse TSA host" "concoursetsa" "concourse-web:2222"

# Jenkins Variables
create_secret "Jenkins URL" "jenkinsurl" "http://jenkins:8080"
create_secret "Jenkins user" "jenkinsuser" "admin"
create_secret "Jenkins API token" "jenkinstoken" "***"

