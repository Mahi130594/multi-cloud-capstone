#!/usr/bin/env bash
set -euo pipefail

REGISTRY_URL=$1
TAG=${2:-latest}

echo "[BUILD] Building and pushing images with tag $TAG"

# API
docker build -t $REGISTRY_URL/api:$TAG ./api
docker push $REGISTRY_URL/api:$TAG

# Web
docker build -t $REGISTRY_URL/web:$TAG ./web
docker push $REGISTRY_URL/web:$TAG

echo "[BUILD] Images pushed successfully."
