#!/bin/bash

#$APP_NAME="nodejs-docker-app"
#$REPOSITORY_NAME="dlessa/nodejs-docker-app"

docker container kill nodejs-docker-app > /dev/null 2>&1
docker container rm nodejs-docker-app > /dev/null 2>&1
docker container run -d -p 4000:4000 --name nodejs-docker-app dlessa/nodejs-docker-app:latest