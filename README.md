# DevSecOps CI/CD Security Pipeline

A secure CI/CD pipeline implementing multiple security controls to detect vulnerabilities early in the development lifecycle.

Modern software development relies heavily on open-source dependencies and containerized deployments.  
This project demonstrates how DevSecOps practices can be integrated directly into the CI/CD workflow using automated security checks.

The pipeline enforces **security gates** that block pull requests when critical vulnerabilities are detected.

---

# Pipeline Architecture

Developer Push
      ↓
GitHub Actions CI/CD
      ↓
Secret Scanning (Gitleaks)
      ↓
SAST (Semgrep)
      ↓
Dependency Scanning (Trivy FS)
      ↓
Docker Build
      ↓
Container Vulnerability Scanning (Trivy Image)

Secrets are automatically blocked at pull request level using **GitLeaks**.

---

# Security Controls Implemented

| Security Layer | Tool | Purpose |
|---|---|---|
Secret Scanning | Gitleaks | Detect leaked credentials |
SAST | Semgrep | Detect insecure code patterns |
Dependency Scanning | Trivy FS | Detect vulnerable libraries |
Container Scanning | Trivy | Detect CVEs in container images |
Container Hardening | Dockerfile | Run container as non-root |

---

# Security Gate Examples

The following security scenarios were intentionally tested to validate the pipeline:

- Hardcoded AWS credentials detected → Pipeline blocked  
- Command injection pattern detected by Semgrep → Pipeline blocked  
- Critical CVE detected in container image → Pipeline blocked  

This demonstrates that the pipeline enforces security policies before code can be merged.

---

# Tech Stack

- GitHub Actions
- Docker
- Node.js
- Semgrep
- Gitleaks
- Trivy

---

# Running the Project

Build the container:

```bash
docker build -t cicd-secure-app .