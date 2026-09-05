#!/bin/bash
echo "Destroying GKE cluster and all associated resources..."
terraform destroy -auto-approve
