docker build -t %DOCKER_USERNAME%/nexus:latest .\docker\nexus\ --no-cache
@REM docker push %DOCKER_USERNAME%/nexus:latest