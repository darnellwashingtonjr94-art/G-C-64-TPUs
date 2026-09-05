#!/bin/bash

echo "Applying Prometheus alert rules for TPU infrastructure..."
kubectl apply -f prometheus-alerts.yaml

echo "Verifying PrometheusRule custom resource..."
kubectl get prometheusrules -n default
