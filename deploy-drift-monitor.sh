#!/bin/bash

echo "Deploying Evidently AI model drift monitoring service..."
kubectl apply -f drift-monitor-deployment.yaml

echo "Verifying drift monitor deployment status..."
kubectl rollout status deployment/model-drift-monitor --timeout=120s

echo "Model drift detection framework successfully initialized."
