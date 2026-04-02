# 💡 DevOps Interview Questions & Answers (Expanded)

Core DevOps and CI/CD interview questions (20+ total) covering internet communication protocols and concepts.

---

## 1. What is a Pull Request (PR)?
**Answer**: A notification that code changes are ready for review and merge.

---

## 2. CI vs CD
**Answer**: CI (Build/Test); CD (Automated Release).

---

## 3. What is Docker?
**Answer**: Containerization platform. Packages app + dependencies.

```bash
# Docker Basics
docker build -t myapp .
docker run -p 8080:80 myapp
```

---

## 4. Design a CI/CD Pipeline
**Answer**: See DevOps module for details.

---

## 5. What is Kubernetes (K8s)?
**Answer**: An open-source system for automating deployment, scaling, and management of containerized applications.

---

## 6. Infrastructure as Code (IaC)
**Answer**: Managing and provisioning infrastructure through machine-readable definition files (code), rather than manual hardware configuration.
**Tools**: Terraform, CloudFormation.

---

## 7. Configuration Management
**Answer**: Maintaining a consistent state for applications and infrastructure.
**Tools**: Ansible, Puppet, Chef.

---

## 8. Monitoring vs Observability
**Answer**:
- **Monitoring**: "Is the system healthy?" (Dashboard).
- **Observability**: "Why is the system unhealthy?" (Logs, Traces).

---

## 9. Blue-Green vs Canary Deployment
**Answer**:
- **Blue-Green**: Two identical environments. Switch traffic from Blue to Green all at once.
- **Canary**: Gradually roll out changes to a small subset of users before everyone.

---

## 10. GIT Branching Strategy (Git Flow)
**Answer**:
- **Master/Main**: Production-ready.
- **Develop**: Ongoing development.
- **Feature**: Individual features.
- **Hotfix**: Critical bugs in production.

---

## 11. IaaS vs PaaS vs SaaS
**Answer**:
- **IaaS**: Infrastructure (AWS EC2).
- **PaaS**: Platform (Heroku, Google App Engine).
- **SaaS**: Software (Gmail, Slack).

---

## 12. Handling Secrets in DevOps
**Answer**: Never commit sensitive data to Git. Use Secret Managers (AWS Secrets Manager, Vault) and environment variables (`.env`).

---

## 13. Linting and Static Analysis
**Answer**: Tools like ESLint or SonarQube that check code quality and security vulnerabilities without executing the code.

---

## 14. Agile vs DevOps
**Answer**:
- **Agile**: Focuses on the *process* of writing software.
- **DevOps**: Focuses on the *system* of delivering software.

---

## 15. Serverless Architecture
**Answer**: Cloud-native design where the cloud provider manages the server infrastructure (e.g., AWS Lambda).

---

## 16. What is a "Rollback"?
**Answer**: Reverting to a previous stable version of software when a new deployment fails.

---

## 17. Docker vs Virtual Machines (VMs)
**Answer**:
- **Docker**: Shares Host OS kernel (Lightweight).
- **VM**: Includes entire Guest OS (Heavy).

---

## 18. Prometheus and Grafana
**Answer**: Prometheus (Metric collection/storage); Grafana (Visualizing metrics through dashboards).

---

## 19. Semantic Versioning (SemVer)
**Answer**: Versioning format: `MAJOR.MINOR.PATCH` (e.g., `1.2.3`).

---

## 20. Microservices Benefits
**Answer**: Independent scaling, technology flexibility, and improved fault isolation.

---

## 🎓 Summary Table: DevOps Tools

| Category | Top Tool | Use Case |
| :--- | :--- | :--- |
| **CI/CD** | Jenkins / GitHub Actions | Automation. |
| **Container** | Docker | Packaging. |
| **Orchestration** | Kubernetes | Management. |
| **IaC** | Terraform | Provisioning. |
| **Monitoring** | Prometheus | Tracking health. |
