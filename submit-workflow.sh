#!/bin/bash

echo "Submitting Argo ML workflow to cluster..."
argo submit workflow.yaml --watch

echo "Fetching workflow execution history..."
argo list
