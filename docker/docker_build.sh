#!/bin/bash

cd "$(dirname "$0")"/..
docker build -t pdl_se --progress=plain .
