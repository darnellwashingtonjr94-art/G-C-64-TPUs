#!/bin/bash
# Ensure you are authenticated to your cluster (e.g., via gcloud for GKE) before running

echo "Applying deployment and service manifests..."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

echo "Waiting for deployment to roll out..."
kubectl rollout status deployment/g-c-64-tpus-deployment

echo "Deployment complete. Current pods:"
kubectl get pods -l app=tpu-workload
