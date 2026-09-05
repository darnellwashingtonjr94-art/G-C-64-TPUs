#!/bin/bash

echo "Deploying Grafana dashboard ConfigMap..."
kubectl apply -f grafana-dashboard-tpus.yaml

echo "Verifying dashboard ConfigMap registration..."
kubectl get configmap grafana-dashboard-g-c-64-tpus -n default
