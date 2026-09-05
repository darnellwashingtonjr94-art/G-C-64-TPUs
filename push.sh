#!/bin/bash
DOCKER_USERNAME="your_dockerhub_username"
IMAGE_NAME="g-c-64-tpus"
TAG="latest"

docker login -u $DOCKER_USERNAME
docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG
