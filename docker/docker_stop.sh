#!/bin/bash

DOCKER_NAME=pdl-se

docker ps --filter name=$DOCKER_NAME -aq | xargs docker rm --force
