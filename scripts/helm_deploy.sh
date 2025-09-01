#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
CLOUD=${2:-aws}
TAG=${3:-latest}

echo "[DEPLOY] Deploying Helm chart for $CLOUD/$ENV with image tag $TAG"

helm upgrade --install product-app ./charts \
  -f charts/values.yaml \
  -f charts/values-$CLOUD.yaml \
  --set image.tag=$TAG \
  --namespace $ENV --create-namespace

echo "[DEPLOY] Helm deployment completed."
