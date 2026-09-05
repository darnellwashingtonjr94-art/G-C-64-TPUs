#!/bin/bash

echo "Deploying MLflow Model Registry to the cluster..."
kubectl apply -f mlflow-deployment.yaml
kubectl apply -f mlflow-service.yaml

echo "Waiting for MLflow pod to become ready..."
kubectl rollout status deployment/mlflow-tracking-server

echo "MLflow tracking server deployed successfully."
