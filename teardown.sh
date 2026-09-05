#!/bin/bash

echo "Deleting TPU workload resources..."
kubectl delete -f service.yaml
kubectl delete -f deployment.yaml

echo "Resources successfully removed."
