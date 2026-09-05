#!/bin/bash

echo "Applying External Secrets configurations..."
kubectl apply -f secretstore.yaml
kubectl apply -f externalsecret.yaml

echo "Verifying external secret synchronization status..."
kubectl get externalsecret tpu-model-credentials
