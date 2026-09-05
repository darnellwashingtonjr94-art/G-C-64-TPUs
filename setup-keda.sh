#!/bin/bash

echo "Checking KEDA operator status..."
kubectl get deployment keda-operator -n keda

echo "Applying KEDA ScaledObject manifest..."
kubectl apply -f scaledobject.yaml

echo "Verifying HPA creation from KEDA..."
kubectl get hpa
