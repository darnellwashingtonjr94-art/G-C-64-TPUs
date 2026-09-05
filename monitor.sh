#!/bin/bash

JOB_NAME="g-c-64-tpus-training-job"

echo "Waiting for the job pod to initialize..."
POD_NAME=$(kubectl get pods --selector=job-name=$JOB_NAME --output=jsonpath='{.items[*].metadata.name}')

if [ -z "$POD_NAME" ]; then
  echo "No pod found for job $JOB_NAME."
  exit 1
fi

echo "Streaming logs for $POD_NAME..."
# Stream logs continuously until the job finishes
kubectl logs -f $POD_NAME

echo "Job execution completed. Fetching final status:"
kubectl get job $JOB_NAME
