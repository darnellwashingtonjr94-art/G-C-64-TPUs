#!/bin/bash

echo "Installing KubeRay operator via Helm..."
helm repo add kuberay https://ray-project.github.io/kuberay-helm
helm repo update
helm upgrade --install kuberay-operator kuberay/kuberay-operator --namespace kuberay-system --create-namespace

echo "Applying RayCluster custom resource for 64 TPUs..."
kubectl apply -f raycluster-tpu.yaml

echo "Verifying RayCluster status..."
kubectl get rayclusters
