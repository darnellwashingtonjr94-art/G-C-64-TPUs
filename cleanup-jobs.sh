#!/bin/bash

echo "Cleaning up finished TPU jobs..."
kubectl delete job g-c-64-tpus-training-job

echo "Cleanup complete."
