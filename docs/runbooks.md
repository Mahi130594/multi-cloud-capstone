# Runbooks — Rollback & Operations

## 🔄 Rollback Procedures

### 1. Application Rollback (API / Web)

1. Identify the failed release using GitHub Actions logs.
2. Roll back Helm release:

   ```bash
   helm rollback myapp <previous_revision> -n prod
   ```
3. Verify pod health:

   ```bash
   kubectl get pods -n prod
   ```
4. Confirm app availability at `/health` endpoint.

### 2. Database Rollback

* **Preferred:** Use managed service point‑in‑time restore (AWS RDS, Azure SQL, Cloud SQL).
* Steps:

  1. Identify restore point from monitoring/alerts.
  2. Create restored DB instance.
  3. Update Kubernetes secret with new DB endpoint.
  4. Redeploy API pods.

### 3. Infrastructure Rollback (Terraform)

1. Check failed `terraform apply` plan.
2. Use `terraform state` to verify last good state.
3. Run `terraform destroy` for faulty resources if needed.
4. Re‑apply last stable version from Git tag:

   ```bash
   git checkout tags/stable-infra-v1
   terraform apply
   ```

---

## 🛠️ Operational Runbooks

### 1. Cluster Access

```bash
aws eks update-kubeconfig --name eks-cluster
az aks get-credentials --name aks-cluster --resource-group rg-devops
gcloud container clusters get-credentials gke-cluster --region us-central1
```

### 2. Secret Management

* Secrets stored in cloud‑native secret stores (AWS Secrets Manager, Azure Key Vault, GCP Secret Manager).
* Sync via External Secrets Operator.

### 3. Scaling Pods

```bash
kubectl scale deploy api-deployment --replicas=5 -n prod
```

### 4. Restart Service

```bash
kubectl rollout restart deploy api-deployment -n prod
```

### 5. Debugging Pods

```bash
kubectl describe pod <pod_name> -n prod
kubectl logs <pod_name> -n prod
```
