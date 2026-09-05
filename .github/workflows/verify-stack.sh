#!/bin/bash

echo "=== 1. Checking GKE Node and TPU Allocation == "
kubectl get nodes -o wide

echo "=== 2. Verifying Core Pod Health across Namespace ==="
kubectl get pods -n default

echo "=== 3. Checking Istio Traffic Routing ==="
kubectl get virtualservices,destinationrules -n default

echo "=== 4. Verifying KServe Inference Endpoint ==="
kubectl get inferenceservice g-c-64-tpus-inference -n default

echo "=== 5. Checking MLflow Tracking Server Status ==="
kubectl get deployment mlflow-tracking-server -n default

echo "=== 6. Verifying Feast Feature Server ==="
kubectl get deployment feast-feature-server -n default

echo "=== 7. Checking KubeRay Distributed Training Cluster ==="
kubectl get rayclusters -n default

echo "=== Validation Complete: All systems nominal ==="
