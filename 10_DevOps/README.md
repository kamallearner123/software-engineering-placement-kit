# 🐧 DevOps: Modern Software Delivery

DevOps is a set of practices that combines software development (Dev) and IT operations (Ops) to shorten the systems development life cycle and provide continuous delivery with high software quality.

## 🎓 Core Concepts

### 1. Version Control (Git/GitHub)
- **Git**: Distributed version control system for tracking changes in source code.
- **GitHub**: Cloud-based platform that hosts Git repositories.
- **Workflow**: Forking, Cloning, Commit/Push, and Pull Requests.

### 2. CI/CD (Continuous Integration & Delivery)
- **Continuous Integration (CI)**: Bug detection and build automation during code submission.
- **Continuous Delivery/Deployment (CD)**: Automated versioning and release of software to users.
- **Tools**: Jenkins, GitHub Actions, CircleCI.

### 3. Containerization (Docker)
- OS-level virtualization to deliver software in packages called containers.
- **Dockerfile**: Blueprint for building a container image.

---

## 🏆 Top 5 Practices for Interviews

1.  **Git Branching Strategy**: Explain how to use Feature, Hotfix, and Master branches.
2.  **Pull Request (PR) Reviews**: Describe how you review code.
3.  **CI/CD Pipeline Design**: Be able to draw a pipeline for an app on a whiteboard.
4.  **Configuration Management**: Using environment variables or files like `.env`.
5.  **Monitoring**: Tracking logs and performance in real-time.

---

## 💻 Sample Code (Simple GitHub Actions Workflow)

```yaml
# .github/workflows/main.yml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2
      - name: Run Tests
        run: npm test
```

## 🛠️ Module Subfolders
- [01_Git_and_GitHub](./01_Git_and_GitHub/README.md)
- [02_CI_CD_Pipelines](./02_CI_CD_Pipelines/README.md)
- [03_Docker_and_Kubernetes](./03_Docker_and_Kubernetes/README.md)

## 🔗 Learning Resources
- [Git Documentation](https://git-scm.com/doc)
- [Jenkins User Guide](https://www.jenkins.io/doc/)
- [Docker Curriculum](https://docker-curriculum.com/)
