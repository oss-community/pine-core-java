# <p align="center">Pine Core Framework</p>

<p align="justify">

Pine Core Framework is a framework based on Java language and, it provides utils, abstractions, etc.

</p>

<p align="justify">

The framework comprised seven components as follows.

</p>

* helper
* documents
* i18n
* model
* contract
* cloud
* test

[Develper document](https://github.com/oss-community/pine-core-java/blob/main/document/docs/pine-framework-v1.pdf).

## <p align="center">Table of Content</p>

- **[Prerequisite](#prerequisite)**
- **[Build](#build)**
- **[Install](#install)**
- **[Pipeline](#pipeline)**
    - **[Maven Pipeline](#maven-pipeline)**
    - **[Jenkins Pipeline](#jenkins-pipeline)**
    - **[Concourse Pipeline](#concourse-pipeline)**

## <span style="color: Crimson">Prerequisite</span>

- Java
- Maven
- Git
- Docker
- Cygwin (Only for Windows users)

## <span style="color: Crimson">Build</span>

``` shell
mvn validate
mvn clean package -DskipTests=true -s settings.xml -P source,javadoc,license
mvn test -s settings.xml
mvn checkstyle:check -s settings.xml -P checkstyle
mvn clean install -DskipTests=true
mvn site:site site:stage -s settings.xml -P site,javadoc,changelog,test-report,github
```

### <span style="color: RoyalBlue">Site</span>

#### Local Deploy

``` shell
mvn site:run -s settings.xml -P site,javadoc,changelog,test-report,github
```

[Site URL](http://localhost:8000).

#### GutHub Deploy

Execute the following commands in the repository.

```shell
git checkout --orphan site
rm .git/index
git clean -fdx
echo ".idea" > .gitignore
echo "site" > index.html
git add . 
git commit -m "initializing site" 
git push origin site
git checkout main
```

Perform the following steps in the GitHub repository.

* Go to GitHub repository > setting > pages
* In the source section
    * set branch site
    * set folder /root

``` shell
mvn scm-publish:publish-scm -s settings.xml -P site,github
```

[GitHub page](https://oss-community.github.io/pine-core-java).

## <span style="color: Crimson">Pipeline</span>

* Generate a GitHub token to access the repository
* Generate a GitHub token for deploying packages to GitHub package.

### <span style="color: RoyalBlue">Maven Pipeline</span>

```shell
#!/bin/bash
source ./mvn-setup-secrets.sh
```

```shell
#!/bin/bash
source ./mvn-setup-environment.sh
```

```shell
#!/bin/bash
source ./mvn-setup-pipeline.sh
```

```shell
# Windows user: This file must run as administrator
./set-env.bat
```

```shell
#!/bin/bash
source ./set-env.sh
```
```shell
#!/bin/bash
# Windows user: Can run via git-bash or CMD and NOT Cygwin
# It must run ONLY ONCE.
source ./git-setup.sh
```

```shell
#!/bin/bash
source ./mvn-run-pipeline.sh
```

### <span style="color: RoyalBlue">Jenkins Pipeline</span>

1. Add jdk with name 'jdk17', maven named 'maven3' and git with name 'git' under system tools.
2. Add secret variables to invoke by `credentials()`.
3. Click on New Item menu in dashboard of [Jenkins](#Jenkins)
4. Select Pipeline and then OK.
5. In the Trigger section check `GitHub hook trigger for GITScm polling` item and insert the url of the project.
6. In Pipeline section, select `Pipeline script from SCM` as pipeline definition.
    - Select Git as an SCM
    - Insert URL of repository in HTTPS format
    - Add credentials (GitHub token as a secret text)
    - Choose branch
    - Insert script path (default is Jenkinsfile) and in this case is in the ci/jenkins directory
7. Click on the save button to see the pipeline dashboard.
8. Click on Build Now menu

To add different credentials type go to [https://github.com/jenkinsci](https://github.com/jenkinsci) and search
`credentials`, then find proper plugin.

```shell
#!/bin/bash
source ./jenkins-setup-secrets.sh
```

```shell
#!/bin/bash
source ./jenkins-setup-environment.sh
```

```shell
#!/bin/bash
source ./jenkins-setup-pipeline.sh
```

```shell
#!/bin/bash
source ./jenkins-add-credentials.sh
```

```shell
#!/bin/bash
# Only if you need to reset the credentials then delete all of them at first
source ./jenkins-delete-credentials.sh
```

### <span style="color: RoyalBlue">Concourse Pipeline</span>

<p align="justify">

Go to the Concourse console `http://localhost:8083` then login via `pine` as user and `pine` as password, after that
download CLI tools and add it to system path. Add private key named `id_rsa` and public key named `id_rsa.pub` that
already generated in `user-home/pine/keys` by `ssh-keygen` to`credentials.yml` file locate in `ci/concourse` folder then
execute the following command. Also deploy `id_rsa.pub` to the repository.

</p>

```shell
#!/bin/bash
source ./create-env-var.sh
```

```shell
#!/bin/bash

GITHUB_USERNAME=$(cat ./secrets/githubusername) # samanalishiri
GITHUB_EMAIL=$(cat ./secrets/githubemail) # samanalishiri@gmail.com
GITHUB_REPOSITORY_ACCESS_TOKEN=$(cat ./secrets/githubrepositoryaccesstoken)
GITHUB_PACKAGE_TOKEN=$(cat ./secrets/githubpackagetoken)
GITHUB_ARTIFACTORY_URL=$(cat ./secrets/githubartifactoryurl) # oss-community/pine-core-java
DOCKER_USERNAME=$(cat ./secrets/dockerusername) # samanalishiri
SONAR_TOKEN=$(cat ./secrets/sonartoken)
SONAR_URL=$(cat ./secrets/sonarurl) # http://sonarqube:9000/
SONAR_DB=$(cat ./secrets/sonardb) # sonar
SONAR_DB_USER=$(cat ./secrets/sonardbuser) # sonar_user
SONAR_DB_PASSWORD=$(cat ./secrets/sonardbpassword) # sonar_pass
SONAR_JDBC_URL=$(cat ./secrets/sonarjdbcurl) # jdbc:postgresql://sonarqube-db:5432/sonar
JFROG_ARTIFACTORY_USERNAME=$(cat ./secrets/jfrogartifactoryusername) # admin
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=$(cat ./secrets/jfrogtoken)
JFROG_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/jfrogartifactorysnapshoturl) # http://jfrog:8081/artifactory/pine-libs-snapshot/
JFROG_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/jfrogartifactoryreleaseurl) # http://jfrog:8081/artifactory/pine-libs-release/
JFROG_ARTIFACTORY_CONTEXT_URL=$(cat ./secrets/jfrogartifactorycontexturl) # http://jfrog:8082/artifactory/
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=$(cat ./secrets/jfrogartifactoryrepositoryprefix) # pine
JFROG_DB=$(cat ./secrets/jfrogdb) # artifactory
JFROG_DB_USER=$(cat ./secrets/jfrogdbuser) # artifactory_user
JFROG_DB_PASSWORD=$(cat ./secrets/jfrogdbpassword) # artifactory_pass
JF_SHARED_DATABASE_TYPE=$(cat ./secrets/jfshareddatabasetype) # postgresql
JF_SHARED_DATABASE_DRIVER=$(cat ./secrets/jfshareddatabasedriver) # "org.postgresql.Driver"
JF_SHARED_DATABASE_URL=$(cat ./secrets/jfshareddatabaseurl) # jdbc:postgresql://jfrog-db:5432/artifactory
NEXUS_ARTIFACTORY_USERNAME=$(cat ./secrets/nexusartifactoryusername) # admin
NEXUS_ARTIFACTORY_PASSWORD=$(cat ./secrets/nexustoken)
NEXUS_ARTIFACTORY_HOST_URL=$(cat ./secrets/nexusartifactoryhosturl) # http://nexus:8081
NEXUS_ARTIFACTORY_SNAPSHOT_URL=$(cat ./secrets/nexusartifactorysnapshoturl) # http://nexus:8081/repository/maven-snapshots/
NEXUS_ARTIFACTORY_RELEASE_URL=$(cat ./secrets/nexusartifactoryreleaseurl) # http://nexus:8081/repository/maven-releases/
CONCOURSE_DB=$(cat ./secrets/concoursedb) # concourse
CONCOURSE_DB_HOST=$(cat ./secrets/concoursedbhost) # concourse-db
CONCOURSE_DB_PORT=$(cat ./secrets/concoursedbport) # 5432
CONCOURSE_DB_USER=$(cat ./secrets/concoursedbuser) # concourse_user
CONCOURSE_DB_PASSWORD=$(cat ./secrets/concoursedbpassword) # concourse_pass
CONCOURSE_EXTERNAL_URL=$(cat ./secrets/concourseexternalurl) # http://localhost:8083
CONCOURSE_CLUSTER_NAME=$(cat ./secrets/concourseclustername) # pineframework
CONCOURSE_ADD_LOCAL_USER=$(cat ./secrets/concourseaddlocaluser) # pine
CONCOURSE_ADD_LOCAL_PASSWORD=$(cat ./secrets/concourseaddlocalpassword) # pine
CONCOURSE_MAIN_TEAM_LOCAL_USER=$(cat ./secrets/concoursemainteamlocaluser) # pine
CONCOURSE_TSA_HOST=$(cat ./secrets/concoursetsa) # concourse-web:2222
JENKINS_URL=$(cat ./secrets/jenkinsurl) # http://jenkins:8080
JENKINS_USER=$(cat ./secrets/jenkinsuser) # admin
JENKINS_API_TOKEN=$(cat ./secrets/jenkinstoken)

mkdir -p ./ci/docker_compose/concourse-postgresql \
./ci/docker_compose/concourse/keys \
./ci/concourse/keys \
./ci/docker_compose/jfrog-postgresql \
./ci/docker_compose/jfrog \
./ci/docker_compose/nexus/nexus-data \
./ci/docker_compose/sonarqube-postgresql \
./ci/docker_compose/sonarqube/sonarqube_data \
./ci/docker_compose/sonarqube/sonarqube_extensions \
./ci/docker_compose/sonarqube/sonarqube_logs \
|| true

echo "#ENV" > ./.env.dev.concourse
echo DOCKER_USERNAME=$DOCKER_USERNAME >> ./.env.dev.concourse
echo GITHUB_USERNAME=$GITHUB_USERNAME >> ./.env.dev.concourse
echo GITHUB_EMAIL=$GITHUB_EMAIL >> ./.env.dev.concourse
echo GITHUB_REPOSITORY_ACCESS_TOKEN=$GITHUB_REPOSITORY_ACCESS_TOKEN >> ./.env.dev.concourse
echo GITHUB_PACKAGE_TOKEN=$GITHUB_PACKAGE_TOKEN >> ./.env.dev.concourse
echo GITHUB_ARTIFACTORY_URL=$GITHUB_ARTIFACTORY_URL >> ./.env.dev.concourse
echo SONAR_DB=$SONAR_DB >> ./.env.dev.concourse
echo SONAR_DB_USER=$SONAR_DB_USER >> ./.env.dev.concourse
echo SONAR_DB_PASSWORD=$SONAR_DB_PASSWORD >> ./.env.dev.concourse
echo SONAR_JDBC_URL=$SONAR_JDBC_URL >> ./.env.dev.concourse
echo JFROG_DB=$JFROG_DB >> ./.env.dev.concourse
echo JFROG_DB_USER=$JFROG_DB_USER >> ./.env.dev.concourse
echo JFROG_DB_PASSWORD=$JFROG_DB_PASSWORD >> ./.env.dev.concourse
echo JF_SHARED_DATABASE_TYPE=$JF_SHARED_DATABASE_TYPE >> ./.env.dev.concourse
echo JF_SHARED_DATABASE_DRIVER=$JF_SHARED_DATABASE_DRIVER >> ./.env.dev.concourse
echo JF_SHARED_DATABASE_URL=$JF_SHARED_DATABASE_URL >> ./.env.dev.concourse
echo CONCOURSE_DB=$CONCOURSE_DB >> ./.env.dev.concourse
echo CONCOURSE_DB_HOST=CONCOURSE_DB_HOST >> ./.env.dev.concourse
echo CONCOURSE_DB_PORT=$CONCOURSE_DB_PORT >> ./.env.dev.concourse
echo CONCOURSE_DB_USER=$CONCOURSE_DB_USER >> ./.env.dev.concourse
echo CONCOURSE_DB_PASSWORD=$CONCOURSE_DB_PASSWORD >> ./.env.dev.concourse
echo CONCOURSE_EXTERNAL_URL=$CONCOURSE_EXTERNAL_URL >> ./.env.dev.concourse
echo CONCOURSE_CLUSTER_NAME=$CONCOURSE_CLUSTER_NAME >> ./.env.dev.concourse
echo CONCOURSE_ADD_LOCAL_USER=$CONCOURSE_ADD_LOCAL_USER >> ./.env.dev.concourse
echo CONCOURSE_ADD_LOCAL_PASSWORD=$CONCOURSE_ADD_LOCAL_PASSWORD >> ./.env.dev.concourse
echo CONCOURSE_MAIN_TEAM_LOCAL_USER=$CONCOURSE_MAIN_TEAM_LOCAL_USER >> ./.env.dev.concourse
echo CONCOURSE_TSA_HOST=$CONCOURSE_TSA_HOST >> ./.env.dev.concourse

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

ssh-keygen -t rsa -C "concourse_team" -f ./ci/concourse/keys/pipeline
gh auth login -p ssh -h github.com --with-token < githubrepositoryaccesstoken
gh repo deploy-key add ./ci/concourse/keys/pipeline.pub -R $GITHUB_ARTIFACTORY_URL -t concourse_team-key-pub -w
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/session_signing_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/tsa_host_key
ssh-keygen -t rsa -b 4096 -m PEM -f ./ci/concourse/keys/worker_key
mv ./ci/concourse/keys/worker_key.pub ./ci/concourse/keys/authorized_worker_keys

docker build -t $DOCKER_USERNAME/jenkins:latest ./docker/jenkins/ --no-cache
docker build -t $DOCKER_USERNAME/openjdk17:latest ./docker/openjdk17/ --no-cache
docker build -t $DOCKER_USERNAME/pine-alpine:latest ./docker/pinealpine/ --no-cache

docker compose --file docker-compose-concourse.yml --project-name dev-concourse --env-file .env.dev.concourse up --build -d
```

```shell
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

SONAR_TOKEN=$(curl -f -u "$SONAR_USERNAME:$SONAR_PASSWORD" -X POST "$SONAR_URL/api/user_tokens/generate" -d "name=$SONAR_USERNAME")
echo "$SONAR_TOKEN" > ./secrets/sonartoken

# jfrog
echo "JFrog Config"
echo "Login $(cat ./secrets/jfrogartifactorycontexturl) and keep/change the default credentials to, for example 'admin/password'"
echo "Create maven repository with $(cat ./secrets/jfrogartifactoryrepositoryprefix) prefix via Web UI in OSS version."
echo "default username: admin"
echo "default password: password"

ARTIFACTORY_URL=$(cat ./secrets/jfrogartifactorycontexturl)
REPO_KEY=$(cat ./secrets/jfrogartifactoryrepositoryprefix)

read -p "Enter username [default: admin]: " jfrogusername
JFROG_USERNAME=${jfrogusername:-admin}
echo "$JFROG_USERNAME" > ./secrets/jfrogartifactoryusername

read -p "Enter new password [default: password]: " jfrogpassword
JFROG_PASSWORD=${jfrogpassword:-password}

JFROG_ENCRYPTED_PASSWORD=$(curl -f -u "$JFROG_USERNAME:$JFROG_PASSWORD" -X GET "$ARTIFACTORY_URL/api/security/encryptedPassword")
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
NEXUS_PASSWORD=${nexuspassword:-$DEFAULT_NEXUS_PASSWORD}
echo "$NEXUS_PASSWORD" > ./secrets/nexustoken
```

Replace *** values with valid value in Concourse credentials file.

```shell
fly --target pine login --team-name main --concourse-url http://localhost:8083 -u pine -p pine
fly --target pine set-pipeline --pipeline pine --config ./ci/concourse/pipeline.yml --load-vars-from ./ci/concourse/credentials.yml
fly -t pine unpause-pipeline -p pine
```

#### <p align="center"> [Top](#Pine-Core-Framework) </p>