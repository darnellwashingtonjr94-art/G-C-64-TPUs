#!/bin/bash
DOCKER_USERNAME="your_dockerhub_username"
IMAGE_NAME="g-c-64-tpus"
TAG="latest"

docker rmi $DOCKER_USERNAME/$IMAGE_NAME:$TAG
