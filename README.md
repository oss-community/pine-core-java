```shell
docker build -t samanalishiri/jenkins:latest ./docker/jenkins/ --no-cache
```

```shell
docker compose --file .\docker\docker-compose.yml --project-name pine-pipeline --env-file .\docker\.env up --build -d
```


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

- **[Prerequisite](#Prerequisite)**
- **[Tools](#Tools)**
    - **[Java](#Java)**
    - **[Maven](#Maven)**
    - **[Git](#Git)**
        - **[GitHub CLI](#GitHub-CLI)**
    - **[SonarQube](#Sonarqube)**
        - **[Sonarqube Server](#Sonarqube-Server)**
        - **[Sonar Scanner](#Sonar-Scanner)**
    - **[Jenkins](#Jenkins)**
    - **[JFrog](#JFrog)**
    - **[Nexus3](#Nexus3)**
    - **[IDE Setting](#IDE-Setting)**
        - **[Intellij IDEA](#Intellij-IDEA)**
    - **[Ngrok](#Ngrok)**
    - **[Docker](#Docker)**
    - **[Podman](#Podman)**
    - **[Concourse](#Concourse)**
- **[Build](#Build-and-Test)**
- **[Install](#Install)**
- **[Pipeline](#Pipeline)**
    - **[Setup Pipeline Tools](#Setup-Pipeline-Tools)**
    - **[Maven Pipeline](#Maven-Pipeline)**
    - **[Jenkins Pipeline](#Jenkins-Pipeline)**
    - **[Concourse Pipeline](#Concourse-Pipeline)**

## <span style="color: Crimson">Prerequisite</span>

- Java
- Maven
- Git
- Docker/Podman (Only for pipeline)

## <span style="color: Crimson">Tools</span>

This tools use to build and pipeline. You do not need to install pipeline tools in locally.

### <span style="color: RoyalBlue">Java</span>

#### Windows

Download [Java 17](https://www.oracle.com/java/technologies/downloads/#jdk17-windows) in zip format then, execute the
following commands to install.

```shell
mkdir C:\sdk\jdk-17
tar -xvf %HOMEPATH%\Downloads\jdk-17_windows-x64_bin.zip --directory C:\sdk\jdk-17 --strip-components=1
set JAVA_HOME=C:\sdk\jdk-17
setx /M JAVA_HOME C:\sdk\jdk-17
setx /M PATH "%PATH%;%JAVA_HOME%\bin"
```

#### Linux

Download [Java 17](https://www.oracle.com/java/technologies/downloads/#jdk17-linux) in tar.gz format then, execute the
following commands to install.

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir -p /opt/jdk-17
tar -xvf ~/Downloads/jdk-17_linux-x64_bin.tar.gz --directory /opt/jdk-17 --strip-components=1
sudo chmod +x -R /opt/java-17/bin/
echo "export JAVA_HOME=/opt/jdk-17" >> ${HOME}/.bashrc
#redhat base
sed -i 's/$PATH/$JAVA_HOME\/bin:$PATH/g' .bashrc
#debian base
sed -i 's/PATH=/PATH=$JAVA_HOME\/bin:/' .bashrc
source ~/.bashrc
```

#### Test Java

```shell
java -version
```

### <span style="color: RoyalBlue">Maven</span>

#### Windows

Download [Maven](https://maven.apache.org/download.cgi) in zip format then, execute the following commands to install.

```shell
mkdir C:\sdk\maven
tar -xvf %HOMEPATH%\Downloads\apache-maven-*-bin.zip --directory C:\sdk\maven --strip-components=1
set M2_HOME=C:\sdk\maven
setx /M M2_HOME C:\sdk\maven
setx /M PATH "%PATH%;%M2_HOME%\bin"
```

#### Linux

Download [Maven](https://maven.apache.org/download.cgi) in tar.gz format then, execute the following commands to
install.

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir /opt/maven
tar -xvf ~/Downloads/maven*.tar.gz --directory /opt/maven --strip-components=1
sudo chmod +x -R /opt/maven/bin/
echo "export M2_HOME=/opt/maven" >> ${HOME}/.bashrc
#redhat
sed -i 's/$PATH/M2_HOME\/bin:$PATH/g' .bashrc
#debian
sed -i 's/PATH=/PATH=$M2_HOME\/bin:/' .bashrc
source ~/.bashrc
```

#### Test Maven

```shell
mvn -version
```

### <span style="color: RoyalBlue">Git</span>

#### Windows

Download [Git](https://git-scm.com/download/win) installer, then install the setup.

#### Linux

[Guidance](https://git-scm.com/download/linux) of how to download and install for linux distributions.

```shell
# ubuntu
apt-get install git
# Fedora
dnf install git
```

#### Test Git

```shell
git --version
```

#### Git and GitHub

To begin, create a repository in [GitHub](https://github.com) then, init repository in your local machine in order to
push to GitHub. It is possible to replace an organization name instead of the username in origin URL.

```shell
git init
# optional
# echo "# exclude files" > .gitignore
# echo "# Guide" > README.md
git add .
git commit -m "initializing repository"
git branch -M main
git remote add origin https://github.com/username/repository.git
git push -u origin main
```

#### GitHub CLI

Visit [GitHub CLI](https://github.com/cli/cli) home page to see full guidance of install.

##### Windows

<p align="justify">

Download zip/msi file from [download page](https://github.com/cli/cli/releases) and if you download zip file then
execute the following commands to install.

</p>

```shell
mkdir C:\sdk\gh
tar -xvf %HOMEPATH%\Downloads\gh_*_windows_*.zip --directory C:\sdk\gh --strip-components=1
set GH_HOME=C:\sdk\gh
setx /M GH_HOME C:\sdk\gh
setx /M PATH "%PATH%;%GH_HOME%\bin"
```

##### Linux

```shell
# ubuntu
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt-get update
apt-get -y install gh
```

##### Test GitHub CLI

```shell
gh –-version
```

##### Login

<p align="justify">

In order to login via GitHub CLI (gh), at first generate a
[token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
by GitHub then create a text file named `token.txt` and copy the token from GitHub and paste in the `token.txt`after
that login with the following command.

</p>

```shell
   gh auth login -p ssh -h github.com --with-token < token.txt
   gh repo list
```

To Generate ssh keys by git tool (select one solution).

```shell
  #solution 1: interactive mode
  ssh-keygen -t rsa -C "comment"
```

```shell
  #solution 2: without prompt
  ssh-keygen -t rsa -C "comment" -N '' -f ~/.ssh/id_rsa
```

To Deploy public keys via GitHub CLI (select one solution). Owner is a username or organization name.

```shell
  #solution 1: deploy key into repository
  gh repo deploy-key add ~/.ssh/id_rsa.pub -R owner/repository-name -t key-title -w
  ssh -T git@github.com
```

```shell
  #solution 2: deploy key into user profile
  gh ssh-key add ~/.ssh/id_rsa.pub
  ssh -T git@github.com
```

To delete the public keys via GitHub CLI.

```shell
gh repo deploy-key delete $(gh repo deploy-key list -R owner/repository-name | awk '{print ($1==""?"":$1)}') -R owner/repository-name || true

```

### <span style="color: RoyalBlue">Sonarqube</span>

#### Sonarqube Server

<p align="justify">

Download [sonarqube](https://www.sonarqube.org/downloads/) and execute the following
command to install.

</p>

##### Windows

```shell
mkdir C:\sdk\sonarqube
tar -xvf %HOMEPATH%\Downloads\sonarqube-*.zip --directory C:\sdk\sonarqube --strip-components=1
set SONARQUBE_HOME=C:\sdk\sonarqube
setx /M SONARQUBE_HOME C:\sdk\sonarqube
```

###### Start

To start the sonarqube execute the following command.

```shell
%SONARQUBE_HOME%/bin/windows-x86-64/StartSonar.bat
```

##### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir /opt/sonarqube
tar -xvf ~/Downloads/sonarqube-*.tar.gz --directory /opt/sonarqube --strip-components=1
sudo chmod +x -R /opt/sonarqube/bin/
echo "export SONARQUBE_HOME=/opt/sonarqube" >> ${HOME}/.bashrc
source ~/.bashrc
```

###### Start

To start the sonarqube execute the following command.

```shell
$SONARQUBE_HOME/bin/linux-x86-64/sonar.sh start
```

##### Dashboard

In order to access to dashboard of sonarqube, browse SonarQube URL therefore, for localhost installation it is
`http://localhost:9000`.

* username: admin
* password: admin

To Generate token go to _**My Account > security > Generate Tokens**_ then, you can use that in application
configuration.

##### Environment

To add sonarqube properties as environment variable. (This part is optional)

###### Windows

```shell
setx /M SONAR_TOKEN token
setx /M SONAR_URL http://localhost:9000
```

###### Linux

```shell
echo "export SONAR_TOKEN=token" >> ${HOME}/.bashrc
echo "export SONAR_URL=http://localhost:9000" >> ${HOME}/.bashrc
```

#### Sonar Scanner

<p align="justify">

Download [sonar scanner cli](https://binaries.sonarsource.com/?prefix=Distribution/sonar-scanner-cli/), then execute the
following commands to install.

</p>

##### Windows

```shell
mkdir C:\sdk\sonar-scanner
tar -xvf %HOMEPATH%\Downloads\sonar-scanner-cli-*.zip --directory C:\sdk\sonar-scanner --strip-components=1
set SONAR_SCANNER_HOME=C:\sdk\sonar-scanner
setx /M SONAR_SCANNER_HOME C:\sdk\sonar-scanner
setx /M PATH "%PATH%;%SONAR_SCANNER_HOME%\bin"
```

##### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir /opt/sonar-scanner
tar -xvf ~/Downloads/sonar-scanner-cli-*.tar --directory /opt/sonar-scanner --strip-components=1
sudo chmod +x -R /opt/sonar-scanner/bin/
echo "export SONAR_SCANNER_HOME=/opt/sonar-scanner" >> ${HOME}/.bashrc
# redhat base
sed -i 's/$PATH/$SONAR_SCANNER_HOME\/bin:$PATH/g' .bashrc
# debian base
sed -i 's/PATH=/PATH=$SONAR_SCANNER_HOME\/bin:/' .bashrc
source ~/.bashrc
```

##### Test Sonar Scanner

```shell
sonar-scanner --version
```

### <span style="color: RoyalBlue">Jenkins</span>

Download [jenkins](https://www.jenkins.io/download/) as a war file and execute the following command to install.

#### Windows

```shell
mkdir C:\sdk\jenkins
move %HOMEPATH%\Downloads\jenkins.war C:\sdk\jenkins
setx /M JENKINS_HOME C:\sdk\jenkins

```

##### Start

```shell
java -jar %JENKINS_HOME%\jenkins.war --httpPort=8080
```

#### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir /opt/jenkins
mv ~/Downloads/jenkins.war /opt/jenkins
echo "export JENKINS_HOME=/opt/jenkins" >> ${HOME}/.bashrc
```

##### Start

```shell
java -jar $JENKINS_HOME/jenkins.war --httpPort=8080
```

#### Dashboard

In order to access to dashboard of Jenkins, browse Jenkins URL therefore, for localhost installation it is
`http://localhost:8080`.

* username: admin
* password: look at the console

### <span style="color: RoyalBlue">JFrog</span>

<p align="justify">

Download [JFrog](https://jfrog.com/community/open-source//) and execute the following command to install.

</p>

#### Windows

```shell
mkdir C:\sdk\jfrog
tar -xvf %HOMEPATH%\Downloads\jfrog-artifactory-oss-*.zip --directory C:\sdk\jfrog --strip-components=1
set JFROG_HOME=C:\sdk\jfrog
setx /M JFROG_HOME C:\sdk\jfrog
```

##### Start

```shell
%JFROG_HOME%\app\bin\artifactory.bat
```

#### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir /opt/jfrog
tar -xvf ~/Downloads/jfrog-artifactory-oss-*.tar --directory /opt/jfrog --strip-components=1
sudo chmod +x -R /opt/jfrog/app/bin/
echo "export JFROG_HOME=/opt/jfrog" >> ${HOME}/.bashrc
source ~/.bashrc
```

##### Start

```shell
$JFROG_HOME/artifactory/app/bin/artifactoryctl
```

#### Dashboard

In order to access to dashboard of JFrog, browse JFrog URL therefore, for localhost installation it is
`http://localhost:8082/ui`.

* username: admin
* password: password

#### Initialization

Follow the instruction for initialization.

- Change password at _**Administration > User Management > Users**_.
- Get encrypted password from _**Edit Profile**_ menu.
- Create repository by _**Quick Setup**_ menu.

### <span style="color: RoyalBlue">Nexus3</span>

<p align="justify">

Download [Nexus3](https://help.sonatype.com/repomanager3/product-information/download). In the extracted path execute
the following command to install.

</p>

#### Windows

```shell
mkdir C:\sdk\sonatype
tar -xvf %HOMEPATH%\Downloads\nexus-3.*-win64.zip --directory C:\sdk\sonatype
ren C:\sdk\sonatype\nexus-* nexus
set NEXUS_HOME=C:\sdk\sonatype
setx /M NEXUS_HOME C:\sdk\sonatype
```

##### Start

```shell
%NEXUS3_HOME%\nexus\bin\nexus /run
```

#### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir -p /opt/sonatype
tar -xvf ~/Downloads/nexus-*-unix.tar.gz.tar --directory /opt/sonatype
mv /opt/sonatype/nexus-* /opt/sonatype/nexus
sudo chmod +x -R /opt/sonatype/nexus/bin/
echo "export NEXUS_HOME=/opt/sonatype" >> ${HOME}/.bashrc
source ~/.bashrc
```

##### Start

```shell
$NEXUS_HOME/nexus/bin/nexus run
```

#### Dashboard

In order to access to dashboard of Nexus, browse Nexus URL therefore, for localhost installation it is
`http://localhost:8081` as a default URL and in our case is `http://localhost:8084`. Also, for changing the
configuration you can modify `nexus-default.properties` under `etc` directory.

* username: admin
* password: print on the console

### <span style="color: RoyalBlue">Ngrok</span>

Go to [Ngrok](https://ngrok.com/) website then, create an account. After downloading ngrok, execute the following
commands to install

#### Windows

```shell
mkdir C:\sdk\ngrok
tar -xvf %HOMEPATH%\Downloads\ngrok-v3-stable-windows-amd64.zip --directory C:\sdk\ngrok --strip-components=1
set NGROK_HOME=C:\sdk\ngrok
setx /M PATH "%PATH%;%NGROK_HOME%"
```

#### Linux

```shell
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir -p /opt/ngrok
tar -xvf ~/Downloads/ngrok-v3-stable-linux-amd64.tgz --directory /opt/ngrok --strip-components=1
sudo chmod +x -R /opt/ngrok/
echo "export NGROK_HOME=/opt/ngrok" >> ${HOME}/.bashrc
#redhat base
sed -i 's/$PATH/$NGROK_HOME:$PATH/g' .bashrc
#debian base
sed -i 's/PATH=/PATH=$NGROK_HOME:/' .bashrc
source ~/.bashrc
```

#### Configuration

Next step is adding a token to ngrok configuration. The token is accessible in dashboard of your ngrok account.

```shell
ngrok config add-authtoken <token>
```

#### Define Tunnel

Define tunnel like the following example in the config file. For windows, the path is
`user-home\AppData\Local\ngrok\ngrok.yml`

```yaml
tunnels:
  jenkins:
    addr: 8080
    proto: http
  jfrog:
    addr: 8082
    proto: http
  concourse:
    addr: 8083
    proto: http
  nexus:
    addr: 8084
    proto: http
  sonar:
    addr: 9000
    proto: http
```

#### Start

```shell
ngrok start --all 
```

```shell
ngrok start jenkins 
ngrok start jfrog 
ngrok start nexus 
ngrok start concourse 
ngrok start sonar 
```

#### Dashboard

In order to access to dashboard of Ngrok, browse Ngrok URL therefore, for localhost installation it is
`http://127.0.0.1:4040`.

### <span style="color: RoyalBlue">ِDocker</span>

Install [Docker Desktop](https://docs.docker.com/get-docker/)

### <span style="color: RoyalBlue">Podman</span>

For installation of Podman Compose, it needs to install python compiler.

Install [Podman](https://podman.io/getting-started/installation)<br/>
Install [Podman Desktop](https://podman-desktop.io/)<br/>
Install [Podman compose](https://github.com/containers/podman-compose)<br/>

### <span style="color: RoyalBlue">Concourse</span>

#### Environment variable

As a first step, create a workspace directory and define environment variables in .env file.<br/>

##### Windows

```shell
mkdir %HOMEPATH%\concourse-workspace
cd %HOMEPATH%\concourse-workspace

echo #env > .env
```

##### Linux

```shell
mkdir ~/concourse-workspace
cd ~/concourse-workspace

echo #env > .env
```

```dotenv
CONCOURSE_DB=concourse
CONCOURSE_DB_HOST=concourse-db
CONCOURSE_DB_PORT=5432
CONCOURSE_DB_USER=concourse_user
CONCOURSE_DB_PASSWORD=concourse_pass
CONCOURSE_EXTERNAL_URL=http://localhost:8080
CONCOURSE_CLUSTER_NAME=Company-name
CONCOURSE_ADD_LOCAL_USER=user
CONCOURSE_ADD_LOCAL_PASSWORD=pass
CONCOURSE_MAIN_TEAM_LOCAL_USER=user
CONCOURSE_TSA_HOST=concourse-web:2222
```

#### Certificate

Then, the certificates must be generated and move them to a directory in order to use that as a directory mapping.<br/>

##### Windows

```shell
mkdir %HOMEPATH%\concourse-workspace\keys

call ssh-keygen -t rsa -b 4096 -m PEM -f %HOMEPATH%\concourse-workspace\keys\session_signing_key
call ssh-keygen -t rsa -b 4096 -m PEM -f %HOMEPATH%\concourse-workspace\keys\tsa_host_key
call ssh-keygen -t rsa -b 4096 -m PEM -f %HOMEPATH%\concourse-workspace\keys\worker_key

ren %HOMEPATH%\concourse-workspace\keys\worker_key.pub authorized_worker_keys
```

##### Linux

```shell
mkdir ~/concourse-workspace/keys

ssh-keygen -t rsa -b 4096 -m PEM -f ~/concourse-workspace/keys/session_signing_key
ssh-keygen -t rsa -b 4096 -m PEM -f ~/concourse-workspace/keys/tsa_host_key
ssh-keygen -t rsa -b 4096 -m PEM -f ~/concourse-workspace/keys/worker_key

mv ~/concourse-workspace/keys/worker_key.pub ~/concourse-workspace/keys/authorized_worker_keys
```

#### Docker Configuration

After generating keys, create the following `docker-compose.yml` file in the workspace to execute by Docker/Podman
compose.

```yaml
  concourse-db:
    container_name: concourse-db
    hostname: concourse-db
    restart: always
    image: postgres
    environment:
      POSTGRES_DB: ${CONCOURSE_DB}
      POSTGRES_PASSWORD: ${CONCOURSE_DB_PASSWORD}
      POSTGRES_USER: ${CONCOURSE_DB_USER}
      PGDATA: /database
    ports:
      - "5432:5432"
    volumes:
      - ~/concourse-workspace/concourse_postgresql:/var/lib/postgresql
    ulimits:
      nproc: 262144
      nofile:
        soft: 32000
        hard: 40000
  concourse-web:
    image: concourse/concourse
    container_name: concourse-web
    hostname: concourse-web
    restart: always
    command: web
    privileged: true
    depends_on: [ concourse-db ]
    ports: [ "8080:8080" ]
    volumes:
      - ~/concourse-workspace/keys:/keys
    environment:
      CONCOURSE_POSTGRES_HOST: ${CONCOURSE_DB_HOST}
      CONCOURSE_POSTGRES_PORT: ${CONCOURSE_DB_PORT}
      CONCOURSE_POSTGRES_DATABASE: ${CONCOURSE_DB}
      CONCOURSE_POSTGRES_USER: ${CONCOURSE_DB_USER}
      CONCOURSE_POSTGRES_PASSWORD: ${CONCOURSE_DB_PASSWORD}
      CONCOURSE_ADD_LOCAL_USER: ${CONCOURSE_ADD_LOCAL_USER}:${CONCOURSE_ADD_LOCAL_PASSWORD}
      CONCOURSE_MAIN_TEAM_LOCAL_USER: ${CONCOURSE_MAIN_TEAM_LOCAL_USER}
      CONCOURSE_EXTERNAL_URL: ${CONCOURSE_EXTERNAL_URL}
      CONCOURSE_CLUSTER_NAME: ${CONCOURSE_CLUSTER_NAME}
      CONCOURSE_SESSION_SIGNING_KEY: /keys/session_signing_key
      CONCOURSE_TSA_HOST_KEY: /keys/tsa_host_key
      CONCOURSE_TSA_AUTHORIZED_KEYS: ./keys/authorized_worker_keys
  concourse-worker:
    image: concourse/concourse
    container_name: concourse-worker
    hostname: concourse-worker
    restart: always
    command: worker
    privileged: true
    depends_on: [ concourse-web ]
    volumes:
      - ~/concourse-workspace/keys:/keys
    environment:
      CONCOURSE_WORK_DIR: /var/lib/concourse
      CONCOURSE_TSA_HOST: ${CONCOURSE_TSA_HOST}
      CONCOURSE_TSA_PUBLIC_KEY: /keys/tsa_host_key.pub
      CONCOURSE_TSA_WORKER_PRIVATE_KEY: /keys/worker_key
      CONCOURSE_CONTAINERD_DNS_PROXY_ENABLE: "true"
      CONCOURSE_CONTAINERD_DNS_SERVER: "1.1.1.1,8.8.8.8"
      CONCOURSE_RUNTIME: "containerd"
      CONCOURSE_BAGGAGECLAIM_DRIVER: "naive"
```

##### Start

Finally, deploy the services to Docker/Podman.

```shell
docker compose --file docker-compose.yml --project-name concourse --env-file .env up --build -d
```

#### Dashboard

In order to access to dashboard of Concourse, browse Concourse URL therefore, for localhost installation it is
`http://localhost:8080`.

* Username: user
* Password: pass

#### FLY

Download FLY CLI from concourse dashboard and execute the following commands.

##### Windows

```shell
# solution 1: download via web browser
mkdir C:\sdk\concourse
copy %HOMEPATH%\Downloads\fly C:\sdk\concourse
setx /M FLY_HOME=C:\sdk\concourse
setx /M PATH "%PATH%;%FLY_HOME%"
```

```shell
# solution 2
% $concoursePath = 'C:\sdk\concourse\'; mkdir $concoursePath; `
[Environment]::SetEnvironmentVariable('PATH', "$ENV:PATH;${concoursePath}", 'USER'); `
$concourseURL = 'http://localhost:8080/api/v1/cli?arch=amd64&platform=windows'; `
Invoke-WebRequest $concourseURL -OutFile "${concoursePath}\fly.exe"
```

##### Linux

```shell
# solution 1: download via web browser
sudo chown ${USER} -R /opt/
sudo chmod 765 -R /opt/
mkdir -p /opt/concourse
cp ~/Downloads/fly /opt/concourse
sudo chmod +x -R /opt/concourse/
echo "export FLY_HOME=/opt/concourse" >> ${HOME}/.bashrc
#redhat base
sed -i 's/$PATH/$FLY_HOME:$PATH/g' .bashrc
#debian base
sed -i 's/PATH=/PATH=$FLY_HOME:/' .bashrc
source ~/.bashrc
```

```shell
# solution 2
curl 'http://localhost:8080/api/v1/cli?arch=amd64&platform=linux' -o fly && chmod +x ./fly && mv ./fly /usr/local/bin/
```

##### Login

To login via Concourse CLI (fly), execute the following commands.

```shell
fly --target pipeline-name login --team-name main --concourse-url http://localhost:8080 -u user -p pass
```

### <span style="color: RoyalBlue">IDE Setting</span>

#### Intellij IDEA

##### Checkstyle

Follow the instruction to apply Checkstyle.

* Install [google check style](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea/versions) plugin.
* Add customized checkstyle.xml to _**setting/preferences > Tools > Checkstyle > Configuration File**_.
* Import customized checkstyle.xml to _**setting/preferences > Editor > Code Style > Schema**_.

##### Test Coverage

<p align="justify">

Click on _**Navigate > Search Everywhere**_, then type `Registry...`and in the registry, type `idea.coverage` then
disable.

</p>

* idea.coverage.new.sampling.enable
* idea.coverage.test.tracking.enable
* idea.coverage.tracing.enable

## <span style="color: Crimson">Build and Test</span>

``` shell
mvn validate
mvn clean package -DskipTests=true -s settings.xml -P source,javadoc,license
mvn test -s settings.xml
mvn checkstyle:check -s settings.xml -P checkstyle
mvn install -DskipTests=true -s settings.xml
mvn site:site site:stage -s settings.xml -P site,javadoc,changelog,test-report,github
```

### <span style="color: RoyalBlue">Site</span>

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

* go to GitHub repository > setting > pages
* in the source section
    * set branch site
    * set folder /root

View maven site on [GitHub page](https://oss-community.github.io/pine-core-java/) of project.

``` shell
mvn scm-publish:publish-scm -s settings.xml -P site,github
```

Also, you can see maven site [locally](http://localhost:8000/).

``` shell
mvn site:run -s settings.xml -P site
```

## <span style="color: Crimson">Install</span>

``` shell
mvn validate
mvn clean install -DskipTests=true
```

## <span style="color: Crimson">Pipeline</span>

To begin, set environment variable before install pipeline tools. You have to generate Tokens of GitHub before adding
the variable and, it is possible to add credentials of Sonarqube, JFrog and Nexus after installation. It means those
credential should be updated with valid value after install the tools.

```dotenv
GITHUB_USERNAME=???
GITHUB_EMAIL=???
GITHUB_JENKINS_TOKEN=not_generated
GITHUB_PACKAGE_TOKEN=not_generated
GITHUB_ARTIFACTORY_URL=oss-community/pine-core-java

DOCKER_USERNAME=???

SONAR_TOKEN=not_generated
SONAR_URL=http://pine-sonarqube:9000
SONAR_DB=sonar
SONAR_DB_USER=sonar_user
SONAR_DB_PASSWORD=sonar_pass
SONAR_JDBC_URL=jdbc:postgresql://pine-sonarqube-db:5432/sonar

JFROG_ARTIFACTORY_USERNAME=admin
JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=not_generated
JFROG_ARTIFACTORY_SNAPSHOT_URL=http://pine-jfrog:8081/artifactory/pine-libs-snapshot
JFROG_ARTIFACTORY_RELEASE_URL=http://pine-jfrog:8081/artifactory/pine-libs-release
JFROG_ARTIFACTORY_CONTEXT_URL=http://pine-jfrog:8082/artifactory
JFROG_ARTIFACTORY_REPOSITORY_PREFIX=pine
JFROG_DB=artifactory
JFROG_DB_USER=artifactory_user
JFROG_DB_PASSWORD=artifactory_pass
JF_SHARED_DATABASE_TYPE=postgresql
JF_SHARED_DATABASE_DRIVER="org.postgresql.Driver"
JF_SHARED_DATABASE_URL=jdbc:postgresql://pine-jfrog-db:5432/artifactory

NEXUS_ARTIFACTORY_USERNAME=admin
NEXUS_ARTIFACTORY_PASSWORD=not_generated
NEXUS_ARTIFACTORY_HOST_URL=http://pine-nexus:8081/
NEXUS_ARTIFACTORY_SNAPSHOT_URL=http://pine-nexus:8081/repository/pine-maven-snapshots/
NEXUS_ARTIFACTORY_RELEASE_URL=http://pine-nexus:8081/repository/pine-maven-releases/

CONCOURSE_DB=concourse
CONCOURSE_DB_HOST=pine-concourse-db
CONCOURSE_DB_PORT=5432
CONCOURSE_DB_USER=concourse_user
CONCOURSE_DB_PASSWORD=concourse_pass
CONCOURSE_EXTERNAL_URL=http://localhost:8083
CONCOURSE_CLUSTER_NAME=pineframework
CONCOURSE_ADD_LOCAL_USER=pine
CONCOURSE_ADD_LOCAL_PASSWORD=pine
CONCOURSE_MAIN_TEAM_LOCAL_USER=pine
CONCOURSE_TSA_HOST=pine-concourse-web:2222
```

Then executed `pipeline-install` file that located in root path of project.

#### Windows

If docker and podman installed on the machine, then make sure podman is stopped and docker is running and make sure
docker installation path was added to system path.

```shell
podman machine stop
bcdedit /set hypervisorlaunchtype auto
DockerCli -SwitchDaemon
```

Then execute the following bat file.

```shell
.\pipeline-install.bat
```

#### Linux

```shell
./pipeline-install.sh
```

### Setup Pipeline Tools

Go to the Sonar console `http://localhost:9000` and follow the instruction [SonarQube](#SonarQube) to generate token.
<br/>
Go to the JFrog console `http://localhost:8082/ui` and follow the instruction [JFrog](#JFrog) to get encrypted password.
And create repositories with pine as a prefix.
<br/>
Go to the Nexus console `http://localhost:8084` and add create two repositories named `pine-maven-snapshots` and 
`pine-maven-releases`.
<br/>
Go to the Jenkins console `http://localhost:8080` and add the following secret variables to invoke by `credentials()`.
<br/>

* github_username
* github_email
* github_jenkins_token
* github_package_token
* github_artifactory_url
* sonar_token
* sonar_url
* jfrog_artifactory_username
* jfrog_artifactory_encrypted_password
* jfrog_artifactory_snapshot_url
* jfrog_artifactory_context_url
* jfrog_artifactory_repository_prefix
* nexus-artifactory-username
* nexus-artifactory-password
* nexus-artifactory-host-url
* nexus-artifactory-snapshot-url
* nexus-artifactory-release-url

<p align="justify">

Go to the Concourse console `http://localhost:8083` then login via `pine` as user and `pine` as password, after that
download CLI tools and add it to system path. Add private key named `id_rsa` and public key named `id_rsa.pub` that
already generated in `user-home/pine/keys` by `ssh-keygen` to`credentials.yml` file locate in `ci/concourse` folder then
execute the following command. Also deploy `id_rsa.pub` to the repository.

</p>

### <span style="color: RoyalBlue">Maven Pipeline</span>

At first, it should be replaced the host of tools in pipeline environment variable with `localhost` as a value and use
mapped ports for localhost.

``` shell
mvn validate
mvn clean package -DskipTests=true -s settings.xml -P source,javadoc,license
mvn test -s settings.xml
mvn checkstyle:check -s settings.xml -P checkstyle
mvn install -DskipTests=true -s settings.xml
mvn site:site site:stage -s settings.xml -P site,javadoc,changelog,test-report,github
mvn scm-publish:publish-scm -s settings.xml -P site,github
mvn sonar:sonar -s settings.xml -P sonar
mvn deploy -s settings.xml -P jfrog
mvn deploy -s settings.xml -P github
mvn deploy -s settings.xml -P nexus -DskipTests=true
```

### <span style="color: RoyalBlue">Jenkins Pipeline</span>

1. install [Jenkins](#Jenkins), [JFrog](#JFrog), [Sonarqube](#Sonarqube), [Nexus3](#Nexus3) and [ngrok](#Ngrok)
2. add secret variables to invoke by `credentials()`.
3. click on New Item menu in dashboard of [Jenkins](#Jenkins)
4. select Pipeline and then OK.
5. in the configuration page check `GitHub hook trigger for GITScm polling` item and insert the url of the project.
6. in Advanced Project Options section, select `Pipeline script from SCM` as pipeline definition.
    - select Git as an SCM
    - insert URL of repository in HTTPS format
    - add credentials (GitHub token as a secret text)
    - choose branch
    - insert script path (default is Jenkinsfile) and in this case is in the ci/jenkins directory
7. click on the save button to see the pipeline dashboard.
8. click on Build Now menu

### <span style="color: RoyalBlue">Concourse Pipeline</span>

Replace not_generated values with valid value in Concourse credentials file.

```shell
fly --target pine login --team-name main --concourse-url http://localhost:8083 -u pine -p pine
fly --target pine set-pipeline --pipeline pine --config .\ci\concourse\pipeline.yml --load-vars-from .\ci\concourse\credentials.yml
fly -t pine unpause-pipeline -p pine
```

#### <p align="center"> [Top](#Pine-Core-Framework) </p>