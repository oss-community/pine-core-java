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
- **[Pipeline](#pipeline)**
    - **[Maven](#maven)**
    - **[Jenkins](#jenkins)**
    - **[Concourse](#concourse)**

## <span style="color: Crimson">Prerequisite</span>

- Java
- Maven
- Git
- Docker
- Cygwin (Only for Windows users)

### Cygwin
Add `/bin` under Cygwin installation directory to Windows path.
Open `/etc/nsswitch.conf` under Cygwin installation directory then add `db_home:  windows`.

## <span style="color: Crimson">Build</span>

``` shell
mvn validate
mvn clean package -DskipTests=true -s settings.xml -P source,javadoc,license
mvn test -s settings.xml
mvn checkstyle:check -s settings.xml -P checkstyle
mvn clean install -DskipTests=true -s settings.xml
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

### <span style="color: RoyalBlue">Maven</span>

```shell
#!/bin/bash
# These commands must run ONLY ONCE.
# Windows tip: All command are runnable in windows git bash except 'gh auth login', indeed this command must run CMD.
ssh-keygen -t rsa -C "my_pc"
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
gh auth login # loging via ssh
ssh -T git@github.com
```

```shell
#!/bin/bash
source ./mvn-setup-secrets.sh
```

```shell
#!/bin/bash
source ./mvn-setup-pipeline.sh
```

```shell
#!/bin/bash
source ./mvn-setup-tokens.sh
```

```shell
# Windows user: This file must run as administrator
./mvn-set-env.bat
```

```shell
#!/bin/bash
mvn-source ./mvn-set-env.sh
```

```shell
#!/bin/bash
# Close and open IDE to reload OS variables if you want to use IDE console to run this command 
# windows tip: RestartWindows Console to reload OS variables if you want to use Windows console to run this command
source ./mvn-run-pipeline.sh
```

### <span style="color: RoyalBlue">Jenkins</span>

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
source ./jenkins-setup-pipeline.sh
```

```shell
#!/bin/bash
source ./jenkins-setup-token.sh
```

```shell
#!/bin/bash
source ./jenkins-set-env.sh
```

```shell
#!/bin/bash
# Only if you need to reset the credentials then delete all of them at first
source ./jenkins-delete-ev.sh
```

### <span style="color: RoyalBlue">Concourse Pipeline</span>

```shell
#!/bin/bash
source ./concourse-setup-secrets.sh
```

```shell
#!/bin/bash
source ./concourse-setup-pipeline.sh
```

```shell
#!/bin/bash
source ./concourse-setup-tokens.sh
```

```shell
#!/bin/bash
source ./concourse-set-ev.sh
```

```shell
#!/bin/bash
source ./concourse-run-pipeline.sh
```

### Release

```shell
mvn -B release:clean release:prepare release:perform -DskipTests=true -P github
```
```shell
git tag -d 1.0.0
git push --delete origin 1.0.0
mvn release:rollback
```

## <p align="center"> [Top](#Pine-Core-Framework) </p>