#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
CLOUD=${2:-aws}

echo "[BOOTSTRAP] Initializing Terraform for $CLOUD/$ENV..."

cd infra/envs/$CLOUD

terraform init -backend-config="backend.tfvars" 
terraform plan -var-file="terraform.tfvars.example" -out=tfplan
terraform apply tfplan

echo "[BOOTSTRAP] $CLOUD/$ENV infrastructure provisioned successfully!"
