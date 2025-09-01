# Cost Optimization Tips — CloudOps

## 💡 General Principles

* **Rightsize resources** — Use monitoring data to scale VMs/containers according to demand.
* **Auto‑scale** workloads with HPA (Kubernetes Horizontal Pod Autoscaler).
* **Shutdown non‑prod** clusters during off‑hours.
* **Use spot/preemptible instances** for stateless workloads.

---

## 🌩️ AWS

* **EKS Savings Plan** → Commit usage to reduce per‑hour costs.
* **S3 Storage Classes** → Transition logs to Glacier.
* **CloudWatch Logs** → Define retention (e.g., 30 days) to avoid unbounded costs.
* **RDS** → Use Aurora Serverless v2 for variable workloads.

---

## ☁️ Azure

* **Reserved VM Instances** → Save up to 72% for 1/3‑year commitments.
* **Blob Lifecycle Management** → Auto‑tier to cool/archive.
* **Azure Monitor** → Set data retention policies.
* **AKS** → Use Virtual Node (serverless container instances) for burst workloads.

---

## 🌐 GCP

* **Committed Use Discounts (CUDs)** → Long‑term savings on GKE and Compute Engine.
* **Cloud Storage** → Lifecycle rules for nearline/coldline/archival.
* **Cloud Logging** → Route non‑critical logs to BigQuery with partitioning.
* **GKE Autopilot** → Pay only per pod, reduce idle node costs.

---

## 🌍 Multi‑Cloud Strategies

* Use **FinOps dashboards** (CloudHealth, CloudZero) for visibility.
* Consolidate billing across accounts/projects.
* Compare pricing before provisioning workloads.
* Track **egress costs** (especially cross‑cloud traffic).

---

## 📊 Monitoring & Alerts

* Set budgets and alerts in each cloud.
* Enable anomaly detection for sudden spikes.
* Share monthly cost reports with stakeholders.

---

## ✅ Checklist for Teams

* [ ] Enable resource tagging across all environments.
* [ ] Enforce TTL for dev/test resources.
* [ ] Use serverless where possible.
* [ ] Regularly review idle resources.
* [ ] Evaluate managed services vs. self‑hosted infra.
