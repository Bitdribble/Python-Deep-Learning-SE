#!/bin/bash

cd "$(dirname "$0")"/..
docker build -t pdl-se --progress=plain .