@echo off

@echo off

:: Removing GitHub Credentials
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V GITHUB_USERNAME
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V GITHUB_EMAIL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V GITHUB_REPOSITORY_ACCESS_TOKEN
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V GITHUB_PACKAGE_TOKEN
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V GITHUB_ARTIFACTORY_URL

:: Removing Docker Credentials
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V DOCKER_USERNAME

:: Removing SonarQube Configuration
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_USERNAME
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_TOKEN
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_DB
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_DB_USER
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_DB_PASSWORD
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V SONAR_JDBC_URL

:: Removing JFrog Artifactory Configuration
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_USERNAME
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_SNAPSHOT_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_RELEASE_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_CONTEXT_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_ARTIFACTORY_REPOSITORY_PREFIX
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_DB
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_DB_USER
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JFROG_DB_PASSWORD
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JF_SHARED_DATABASE_TYPE
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JF_SHARED_DATABASE_DRIVER
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V JF_SHARED_DATABASE_URL

:: Removing Nexus Repository Configuration
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V NEXUS_ARTIFACTORY_USERNAME
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V NEXUS_ARTIFACTORY_PASSWORD
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V NEXUS_ARTIFACTORY_HOST_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V NEXUS_ARTIFACTORY_SNAPSHOT_URL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V NEXUS_ARTIFACTORY_RELEASE_URL

:: Refresh Environment Variables
SETX PATH "%PATH%" >nul

:: GitHub Credentials
for /f "tokens=* delims=" %%A in (.\secrets\GITHUB_USERNAME) do setx /M GITHUB_USERNAME "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\GITHUB_EMAIL) do setx /M GITHUB_EMAIL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\GITHUB_REPOSITORY_ACCESS_TOKEN) do setx /M GITHUB_REPOSITORY_ACCESS_TOKEN "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\GITHUB_PACKAGE_TOKEN) do setx /M GITHUB_PACKAGE_TOKEN "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\GITHUB_ARTIFACTORY_URL) do setx /M GITHUB_ARTIFACTORY_URL "%%A"

:: Docker Credentials
for /f "tokens=* delims=" %%A in (.\secrets\DOCKER_USERNAME) do setx /M DOCKER_USERNAME "%%A"

:: SonarQube Configuration
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_USERNAME) do setx /M SONAR_USERNAME "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_TOKEN) do setx /M SONAR_TOKEN "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_URL) do setx /M SONAR_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_DB) do setx /M SONAR_DB "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_DB_USER) do setx /M SONAR_DB_USER "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_DB_PASSWORD) do setx /M SONAR_DB_PASSWORD "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\SONAR_DB_URL) do setx /M SONAR_JDBC_URL "%%A"

:: JFrog Artifactory Configuration
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_USERNAME) do setx /M JFROG_ARTIFACTORY_USERNAME "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD) do setx /M JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_SNAPSHOT_URL) do setx /M JFROG_ARTIFACTORY_SNAPSHOT_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_RELEASE_URL) do setx /M JFROG_ARTIFACTORY_RELEASE_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_CONTEXT_URL) do setx /M JFROG_ARTIFACTORY_CONTEXT_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_ARTIFACTORY_REPOSITORY_PREFIX) do setx /M JFROG_ARTIFACTORY_REPOSITORY_PREFIX "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_DB) do setx /M JFROG_DB "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_DB_USER) do setx /M JFROG_DB_USER "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JFROG_DB_PASSWORD) do setx /M JFROG_DB_PASSWORD "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JF_SHARED_DATABASE_TYPE) do setx /M JF_SHARED_DATABASE_TYPE "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JF_SHARED_DATABASE_DRIVER) do setx /M JF_SHARED_DATABASE_DRIVER "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\JF_SHARED_DATABASE_URL) do setx /M JF_SHARED_DATABASE_URL "%%A"

:: Nexus Repository Configuration
for /f "tokens=* delims=" %%A in (.\secrets\NEXUS_ARTIFACTORY_USERNAME) do setx /M NEXUS_ARTIFACTORY_USERNAME "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\NEXUS_TOKEN) do setx /M NEXUS_ARTIFACTORY_PASSWORD "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\NEXUS_ARTIFACTORY_HOST_URL) do setx /M NEXUS_ARTIFACTORY_HOST_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\NEXUS_ARTIFACTORY_SNAPSHOT_URL) do setx /M NEXUS_ARTIFACTORY_SNAPSHOT_URL "%%A"
for /f "tokens=* delims=" %%A in (.\secrets\NEXUS_ARTIFACTORY_RELEASE_URL) do setx /M NEXUS_ARTIFACTORY_RELEASE_URL "%%A"

:: Refresh Environment Variables
SETX PATH "%PATH%" >nul

echo ============================
echo == GitHub Credentials     ==
echo ============================
echo GITHUB_USERNAME=%GITHUB_USERNAME%
echo GITHUB_EMAIL=%GITHUB_EMAIL%
echo GITHUB_REPOSITORY_ACCESS_TOKEN=%GITHUB_REPOSITORY_ACCESS_TOKEN%
echo GITHUB_PACKAGE_TOKEN=%GITHUB_PACKAGE_TOKEN%
echo GITHUB_ARTIFACTORY_URL=%GITHUB_ARTIFACTORY_URL%

echo ============================
echo == Docker Credentials     ==
echo ============================
echo DOCKER_USERNAME=%DOCKER_USERNAME%

echo ============================
echo == SonarQube Configuration ==
echo ============================
echo SONAR_USERNAME=%SONAR_USERNAME%
echo SONAR_TOKEN=%SONAR_TOKEN%
echo SONAR_URL=%SONAR_URL%
echo SONAR_DB=%SONAR_DB%
echo SONAR_DB_USER=%SONAR_DB_USER%
echo SONAR_DB_PASSWORD=%SONAR_DB_PASSWORD%
echo SONAR_JDBC_URL=%SONAR_JDBC_URL%

echo ============================
echo == JFrog Artifactory Configuration ==
echo ============================
echo JFROG_ARTIFACTORY_USERNAME=%JFROG_ARTIFACTORY_USERNAME%
echo JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD=%JFROG_ARTIFACTORY_ENCRYPTED_PASSWORD%
echo JFROG_ARTIFACTORY_SNAPSHOT_URL=%JFROG_ARTIFACTORY_SNAPSHOT_URL%
echo JFROG_ARTIFACTORY_RELEASE_URL=%JFROG_ARTIFACTORY_RELEASE_URL%
echo JFROG_ARTIFACTORY_CONTEXT_URL=%JFROG_ARTIFACTORY_CONTEXT_URL%
echo JFROG_ARTIFACTORY_REPOSITORY_PREFIX=%JFROG_ARTIFACTORY_REPOSITORY_PREFIX%
echo JFROG_DB=%JFROG_DB%
echo JFROG_DB_USER=%JFROG_DB_USER%
echo JFROG_DB_PASSWORD=%JFROG_DB_PASSWORD%
echo JF_SHARED_DATABASE_TYPE=%JF_SHARED_DATABASE_TYPE%
echo JF_SHARED_DATABASE_DRIVER=%JF_SHARED_DATABASE_DRIVER%
echo JF_SHARED_DATABASE_URL=%JF_SHARED_DATABASE_URL%

echo ============================
echo == Nexus Repository Configuration ==
echo ============================
echo NEXUS_ARTIFACTORY_USERNAME=%NEXUS_ARTIFACTORY_USERNAME%
echo NEXUS_ARTIFACTORY_PASSWORD=%NEXUS_ARTIFACTORY_PASSWORD%
echo NEXUS_ARTIFACTORY_HOST_URL=%NEXUS_ARTIFACTORY_HOST_URL%
echo NEXUS_ARTIFACTORY_SNAPSHOT_URL=%NEXUS_ARTIFACTORY_SNAPSHOT_URL%
echo NEXUS_ARTIFACTORY_RELEASE_URL=%NEXUS_ARTIFACTORY_RELEASE_URL%

echo ============================
echo == Concourse CI Configuration ==
echo ============================
echo CONCOURSE_DB=%CONCOURSE_DB%
echo CONCOURSE_DB_HOST=%CONCOURSE_DB_HOST%
echo CONCOURSE_DB_PORT=%CONCOURSE_DB_PORT%
echo CONCOURSE_DB_USER=%CONCOURSE_DB_USER%
echo CONCOURSE_DB_PASSWORD=%CONCOURSE_DB_PASSWORD%
echo CONCOURSE_EXTERNAL_URL=%CONCOURSE_EXTERNAL_URL%
echo CONCOURSE_CLUSTER_NAME=%CONCOURSE_CLUSTER_NAME%
echo CONCOURSE_ADD_LOCAL_USER=%CONCOURSE_ADD_LOCAL_USER%
echo CONCOURSE_ADD_LOCAL_PASSWORD=%CONCOURSE_ADD_LOCAL_PASSWORD%
echo CONCOURSE_MAIN_TEAM_LOCAL_USER=%CONCOURSE_MAIN_TEAM_LOCAL_USER%
echo CONCOURSE_TSA_HOST=%CONCOURSE_TSA_HOST%

echo ============================
echo == Jenkins Configuration ==
echo ============================
echo JENKINS_URL=%JENKINS_URL%
echo JENKINS_USER=%JENKINS_USER%
echo JENKINS_API_TOKEN=%JENKINS_API_TOKEN%