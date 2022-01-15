#!/bin/bash

DOCKER_CONTAINER_NAME=pdl_se

docker ps --filter name=$DOCKER_CONTAINER_NAME -aq | xargs docker rm --force 2>/dev/null
