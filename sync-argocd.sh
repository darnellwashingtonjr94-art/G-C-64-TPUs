#!/bin/bash

echo "Applying ArgoCD application manifest..."
kubectl apply -f argocd-application.yaml

echo "Verifying application status..."
argocd app get g-c-64-tpus-app
