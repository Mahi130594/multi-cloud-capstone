# System Architecture — Multi‑Cloud DevOps Capstone

## 📌 High‑Level Overview

The system is designed as a **multi‑cloud, containerized web application** deployed across **AWS (EKS), Azure (AKS), and GCP (GKE)**. It demonstrates **scalability, reliability, and observability** through modern DevOps practices.

---

## 🏗️ Components

### 1. Application Layer

* **API Service (Node.js/Express):** Provides `/health` and `/products` endpoints.
* **Web Frontend (React):** SPA consuming the API.
* **Containerization:** Both API and Web are packaged into Docker images.

### 2. Infrastructure Layer

* **IaC:** Terraform provisions resources across AWS, Azure, and GCP.
* **Kubernetes Clusters:** Managed services (EKS, AKS, GKE).
* **Load Balancers:** Cloud‑native ingress load balancers for external access.
* **Storage:** Cloud‑native persistent volumes (EBS, Azure Disk, GCP PD).

### 3. Networking & Security

* **DNS:** Cloudflare routes traffic to multi‑cloud clusters.
* **TLS:** Managed by cert‑manager with Let’s Encrypt.
* **Network Policies:** Restrict pod‑to‑pod communication.
* **Cloud IAM + OIDC:** GitHub Actions authenticates without static secrets.

### 4. CI/CD Layer

* **CI (GitHub Actions):** Lint → Test → Build → Scan → Push Docker images.
* **CD (GitHub Actions):** Helm deploys to clusters per environment.
* **Branch Protection:** Enforced on `main` branch.

### 5. Observability Layer

* **Metrics:** Prometheus scrapes app & cluster metrics.
* **Visualization:** Grafana dashboards for developers & ops.
* **Logging:** Loki (optional) or cloud provider logging.
* **Alerts:** Rules for failures, latency, and pod restarts.

---

## 🌐 Deployment Topology

1. **Local Development:** Docker Compose to validate API + Web.
2. **Cloud Deployments:**

   * AWS EKS (primary)
   * Azure AKS (secondary)
   * GCP GKE (tertiary)
3. **DNS:** Cloudflare load‑balances requests to available clusters.
4. **Failover:** If one cloud cluster is unavailable, Cloudflare routes traffic to another.

---

## 🔄 Data Flow

1. User → Browser → DNS (Cloudflare)
2. Cloudflare → Kubernetes Ingress (EKS/AKS/GKE)
3. Ingress → API Service (Node.js)
4. API → Database (Cloud‑native managed DB like RDS/Cloud SQL)
5. API response → Web frontend → User

---

## 📊 Architecture Diagram (Conceptual)

```
                 +-----------------+
   User Browser  |   Cloudflare    |
        ─────────▶  DNS + TLS Mgmt |
                 +--------┬--------+
                          │
      ┌───────────────────┼─────────────────────┐
      │                   │                     │
+-----▼-----+       +-----▼-----+         +-----▼-----+
|  AWS EKS  |       | Azure AKS |         |  GCP GKE  |
| Ingress   |       | Ingress   |         | Ingress   |
| + API/WEB |       | + API/WEB |         | + API/WEB |
+-----┬-----+       +-----┬-----+         +-----┬-----+
      │                   │                     │
      ▼                   ▼                     ▼
 Managed DB          Managed DB            Managed DB
 (RDS)               (Azure SQL)           (Cloud SQL)
```

---

## ✅ Key Benefits

* **Portability:** Kubernetes abstracts cloud vendor lock‑in.
* **Scalability:** Auto‑scaling at pod & node levels.
* **Resilience:** Multi‑cloud DNS failover.
* **Security:** OIDC + TLS everywhere.
* **Observability:** Metrics, logs, and dashboards.

---

## 📘 References

* [`README.md`](README.md) — Setup instructions
* [`docs/runbooks.md`](runbooks.md) — Rollback & operations
* [`docs/pipelines.md`](pipelines.md) — CI/CD workflow
