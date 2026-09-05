#!/bin/bash

echo "Adding Velero Helm repository..."
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
helm repo update

echo "Creating velero namespace..."
kubectl create namespace velero --dry-run=client -o yaml | kubectl apply -f -

echo "Installing Velero with GCP and CSI configuration..."
helm upgrade --install velero vmware-tanzu/velero \
  --namespace velero \
  -f velero-values.yaml

echo "Applying automated daily backup schedule..."
kubectl apply -f backup-schedule.yaml

echo "Verifying Velero deployment status..."
velero version
