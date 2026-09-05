#!/bin/bash

echo "Submitting TPU training job to the cluster..."
kubectl apply -f tpu-job.yaml

# Wait a few seconds for the Kubernetes API to register the pod
sleep 3

# Trigger the monitoring script to watch the output
./monitor.sh
