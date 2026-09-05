#!/bin/bash

echo "Adding OpenCost Helm repository..."
helm repo add opencost https://opencost.github.io/opencost-helm-chart
helm repo update

echo "Creating opencost namespace..."
kubectl create namespace opencost --dry-run=client -o yaml | kubectl apply -f -

echo "Installing OpenCost for GKE TPU cost allocation..."
helm upgrade --install opencost opencost/opencost \
  --namespace opencost \
  -f opencost-values.yaml

echo "Verifying OpenCost deployment rollout..."
kubectl rollout status deployment/opencost -n opencost --timeout=120s

echo "Access cost allocation metrics via kubectl-cost plugin or port-forward:"
echo "kubectl port-forward svc/opencost 9003:9003 -n opencost"
