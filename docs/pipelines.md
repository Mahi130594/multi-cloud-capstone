# Pipelines — CI/CD Workflows

## Overview

This project uses **GitHub Actions** for CI/CD with workflows covering build, test, security, deploy, and multi‑cloud rollout.

---

## 🏗️ CI Workflow (build‑test‑scan)

* **Trigger:** Pull Request → `main`
* **Jobs:**

  1. **Lint & Unit Test**

     ```yaml
     - name: Run tests
       run: npm test
     ```
  2. **Build Docker Image**

     ```yaml
     - name: Build image
       run: docker build -t ghcr.io/org/myapp:${{ github.sha }} .
     ```
  3. **Security Scan** (Trivy or Snyk)

     ```yaml
     - name: Scan image
       uses: aquasecurity/trivy-action@master
     ```
  4. **Push to Registry**

     ```yaml
     - name: Push
       run: docker push ghcr.io/org/myapp:${{ github.sha }}
     ```

---

## 🚀 CD Workflow (deploy)

* **Trigger:** Merge → `main` or release tag.
* **Jobs:**

  1. **Terraform Plan & Apply**

     ```yaml
     - name: Terraform apply
       run: terraform apply -auto-approve
     ```
  2. **Helm Upgrade**

     ```yaml
     - name: Helm upgrade
       run: helm upgrade myapp charts/myapp -n prod \
         --set image.tag=${{ github.sha }}
     ```
  3. **Post‑Deployment Tests**

     ```yaml
     - name: Health check
       run: curl -f https://myapp.mahendra.devops.example.com/health
     ```

---

## 🌍 Multi‑Cloud Matrix Strategy

* GitHub Actions matrix builds allow deploying to **AWS → Azure → GCP** sequentially.
* Example:

```yaml
strategy:
  matrix:
    cloud: [aws, azure, gcp]
```

---

## 🔐 Secrets & OIDC

* **GitHub → Cloud OIDC federation** (no long‑lived keys).
* Secrets configured:

  * `AWS_ROLE_ARN`
  * `AZURE_CLIENT_ID` / `AZURE_TENANT_ID`
  * `GCP_WORKLOAD_IDENTITY`
  * `CLOUDFLARE_API_TOKEN`

---

## 📊 Observability Integration

* CI: Test coverage reports uploaded to Codecov.
* CD: Alerts on failed rollout → Slack/MS Teams.
* Metrics scraped by Prometheus after deployment.
