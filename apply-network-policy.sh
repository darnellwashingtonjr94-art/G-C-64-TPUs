#!/bin/bash

echo "Applying NetworkPolicy security rules for TPU workloads..."
kubectl apply -f networkpolicy.yaml

echo "Verifying active network policies..."
kubectl get networkpolicies
