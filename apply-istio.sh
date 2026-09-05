#!/bin/bash

echo "Enabling Istio injection for the namespace..."
kubectl label namespace default istio-injection=enabled --overwrite

echo "Applying Istio routing and traffic policy manifests..."
kubectl apply -f virtualservice.yaml
kubectl apply -f destinationrule.yaml

echo "Verifying Istio configuration..."
kubectl get virtualservices,destinationrules
