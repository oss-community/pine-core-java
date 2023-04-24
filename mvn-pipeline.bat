# install sonarqube, jfrog, nexus and setup github for maven site

cls
call echo 'step [validate] begin'
call mvn validate
call echo 'step [validate] end'

call echo 'step [build] begin'
call mvn clean package -DskipTests=true -s settings.xml -P source,javadoc,license
call echo 'step [build] end'

call echo 'step [test] begin'
call mvn test -s settings.xml
call echo 'step [test] end'

call echo 'step [checkstyle] begin'
call mvn checkstyle:check -s settings.xml -P checkstyle
call echo 'step [checkstyle] end'

call echo 'step [sonar] begin'
call mvn sonar:sonar -s settings.xml -P sonar
call echo 'step [sonar] end'

call echo 'step [install] begin'
call mvn install -DskipTests=true -s settings.xml
call echo 'step [install] end'

call echo 'step [site] begin'
call mvn site:site site:stage -s settings.xml -P site,javadoc,changelog,test-report,github
call echo 'step [site] end'

call echo 'step [publish site] begin'
call mvn scm-publish:publish-scm -s settings.xml -P site,github
call echo 'step [publish site] end'

call echo 'step [jfrog artifactory] begin'
call mvn deploy -s settings.xml -P jfrog
call echo 'step [jfrog artifactory] end'

call echo 'step [github artifactory] begin'
call mvn deploy -s settings.xml -P github
call echo 'step [github artifactory] end'

call echo 'step [nexus artifactory] begin'
call mvn deploy -s settings.xml -P nexus -DskipTests=true
call echo 'step [nexus artifactory] end'