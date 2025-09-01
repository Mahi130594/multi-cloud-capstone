# Multi‑Cloud DevOps Capstone

## 📌 Overview

This repository contains Mahendra’s **Multi‑Cloud DevOps Capstone Project**, designed for training and demonstration. It showcases **end‑to‑end DevOps practices** across **AWS (EKS), Azure (AKS), and GCP (GKE)** with:

* Infrastructure as Code (Terraform)
* Containerized microservices (Docker)
* Orchestration (Kubernetes + Helm)
* CI/CD pipelines (GitHub Actions)
* DNS & TLS (Cloudflare + cert‑manager)
* Observability (Prometheus, Grafana, Loki)

The application is a simple **product catalogue**:

* **API:** Node.js/Express, exposes `/health` and `/products`
* **Web:** React SPA, fetches product list from API

---

## 🚀 Features

* Multi‑cloud deployment (AWS → Azure → GCP)
* Central GitHub repo with protected `main`
* Automated builds & scans with CI
* Automated deployments with Helm via CD pipelines
* Cloudflare‑based DNS with HTTPS (Let’s Encrypt)
* Monitoring & logging with Grafana dashboards
* Runbooks for rollback and cleanup

---

## 📂 Repository Structure

```text
multi-cloud-capstone/
├─ app/
│  ├─ api/                # Node.js API
│  └─ web/                # React SPA
├─ charts/                # Helm charts for deployment
├─ infra/                 # Terraform IaC (AWS, Azure, GCP)
├─ k8s-addons/            # Ingress, cert-manager, monitoring addons
├─ .github/workflows/     # CI/CD pipelines
├─ scripts/               # Automation scripts
├─ docs/                  # Documentation (architecture, runbooks, etc.)
└─ README.md
```

---

## 🛠️ Prerequisites

* **Accounts:** AWS, Azure, GCP, Cloudflare
* **Local tools:** Git, Docker, kubectl, Helm, Terraform, Node.js 18+
* **GitHub repo setup:** Branch protections on `main`, OIDC federation for cloud access

---

## ⚙️ Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/<org>/multi-cloud-capstone.git
cd multi-cloud-capstone
```

### 2. Local Development

```bash
docker compose up --build
```

Visit: `http://localhost:5173`

### 3. Infrastructure Provisioning (AWS Example)

```bash
cd infra/envs/aws
terraform init -backend-config=backend.hcl
terraform plan -var-file=terraform.tfvars
terraform apply -auto-approve
```

### 4. Deploy Application with Helm

```bash
helm upgrade --install product-app charts/product-app \
  -f charts/product-app/values-aws.yaml \
  --set buildSha=$(git rev-parse --short HEAD)
```

### 5. Access the App

* URL: `https://app.dev.mahendra.devops.example.com`

---

## 🔄 CI/CD Pipelines

* **CI (`ci.yml`):** Runs linting, testing, Docker builds, image scanning, push to registries.
* **CD (`cd-*.yml`):** Deploys via Helm to AWS, Azure, and GCP environments.

---

## 📊 Observability

* **Metrics:** Prometheus + Grafana dashboards
* **Logs:** Loki (optional) or cloud‑native logging
* **Alerts:** Example rules included (API 5xx, pod restarts)

---

## 🛡️ Security

* OIDC federation from GitHub to cloud (no static keys)
* Image scanning with Trivy
* IaC scanning with tfsec/checkov
* TLS enforced via cert‑manager

---

## 📘 Documentation

* [`docs/architecture.md`](docs/architecture.md) — System architecture
* [`docs/runbooks.md`](docs/runbooks.md) — Rollback & operations
* [`docs/pipelines.md`](docs/pipelines.md) — CI/CD workflows
* [`docs/cost-ops.md`](docs/cost-ops.md) — Cost optimization tips

---

## 🧹 Cleanup

```bash
cd infra/envs/aws
terraform destroy -auto-approve
```

Repeat for Azure/GCP environments.

---

## ✅ Acceptance Criteria

* CI builds & scans pass
* App is live at `https://app.dev.mahendra.devops.example.com`
* Dashboards visible in Grafana
* Rollback works with `helm rollback`

---

## 👤 Author

Mahendra — Hyderabad
