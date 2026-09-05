#!/bin/bash
DOCKER_USERNAME="your_dockerhub_username"
IMAGE_NAME="g-c-64-tpus"
TAG="latest"

docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$TAG .
