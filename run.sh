#!/bin/bash

$APP_NAME="nodejs-docker-app"
$REPOSITORY_NAME="dlessa/nodejs-docker-app"

docker container kill $(APP_NAME) > /dev/null 2>&1
docker image rm --force $(REPOSITORY_NAME) > /dev/null 2>&1
docker container run -d -p 4000:4000 --name $(APP_NAME) $(REPOSITORY_NAME):latest