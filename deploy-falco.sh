#!/bin/bash

echo "Adding Falco security Helm repository..."
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

echo "Creating falco security namespace..."
kubectl create namespace falco --dry-run=client -o yaml | kubectl apply -f -

echo "Installing Falco with eBPF probe configuration..."
helm upgrade --install falco falcosecurity/falco \
  --namespace falco \
  -f falco-values.yaml

echo "Verifying Falco DaemonSet pods deployment status..."
kubectl rollout status daemonset/falco -n falco --timeout=120s

echo "Checking live Falco security logs..."
kubectl logs -n falco -c falco -l app.kubernetes.io/name=falco --tail=20
