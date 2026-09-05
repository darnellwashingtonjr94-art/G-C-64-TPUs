#!/bin/bash

echo "Adding Chaos Mesh Helm repository..."
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

echo "Creating chaos-testing namespace and installing Chaos Mesh..."
kubectl create namespace chaos-testing --dry-run=client -o yaml | kubectl apply -f -
helm upgrade --install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-testing \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/var/run/containerd/containerd.sock

echo "Applying TPU worker resilience chaos experiment..."
kubectl apply -f chaos-experiment.yaml

echo "Verifying active chaos experiments..."
kubectl get podchaos -n default
