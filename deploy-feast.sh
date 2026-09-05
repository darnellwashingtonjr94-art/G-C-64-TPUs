#!/bin/bash

echo "Deploying Feast Feature Store components..."
kubectl apply -f feast-server-deployment.yaml
kubectl apply -f feast-server-service.yaml

echo "Waiting for Feast feature server to become ready..."
kubectl rollout status deployment/feast-feature-server

echo "Feast Feature Store is successfully deployed and ready for use."
