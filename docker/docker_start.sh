#!/bin/bash

DOCKER_NAME=pdl-se
DOCKER_IMAGE=pdl-se
WORKING_DIR=/build/pdl-se

# Is an instance already running?
if [[ $(docker ps --filter name=$DOCKER_NAME -aq) ]]; then
  # Open a shell on that instance
  docker start $DOCKER_NAME >/dev/null 2>&1
  docker exec -it $DOCKER_NAME bash
  exit 0
fi

# Create a brand new instance, but don't make it interactive yet
docker run -it \
       --name $DOCKER_NAME \
       --network="host" \
       -v ~/build:/build \
       -v ~/.Xauthority:/root/.Xauthority \
       -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
       -w $WORKING_DIR \
       --env PYTHONPATH=$WORKING_DIR \
       --env DISPLAY=$DISPLAY \
       $DOCKER_IMAGE
