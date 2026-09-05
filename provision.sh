#!/bin/bash
echo "Initializing Terraform..."
terraform init

echo "Provisioning GKE Cluster and TPU nodes..."
terraform apply -auto-approve

echo "Fetching cluster credentials..."
gcloud container clusters get-credentials g-c-64-tpus-cluster --region us-central2
