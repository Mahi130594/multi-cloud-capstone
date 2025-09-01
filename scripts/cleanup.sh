#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
CLOUD=${2:-aws}

echo "[CLEANUP] Destroying $CLOUD/$ENV resources..."

cd infra/envs/$CLOUD
terraform destroy -var-file="terraform.tfvars.example" -auto-approve

echo "[CLEANUP] $CLOUD/$ENV infrastructure destroyed."
