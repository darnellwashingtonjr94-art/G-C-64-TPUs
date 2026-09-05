#!/bin/bash

echo "Applying KServe InferenceService configuration..."
kubectl apply -f inferenceservice.yaml

echo "Waiting for the inference service to become ready..."
kubectl wait inferenceservice g-c-64-tpus-inference --for=condition=Ready --timeout=300s

echo "Retrieving InferenceService endpoint URL..."
kubectl get inferenceservice g-c-64-tpus-inference
