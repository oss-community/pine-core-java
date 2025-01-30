docker build -t %DOCKER_USERNAME%/jenkins:latest .\docker\jenkins\ --no-cache
@REM docker push %DOCKER_USERNAME%/jenkins:latest