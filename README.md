# 🧪 Gitea DevOps Challenge – Infrastructure-as-Code Demo

This project is part of a technical DevOps challenge. It provisions a self-hosted [Gitea](https://gitea.io/) instance using **Terraform**, **Docker**, and **automation best practices** including:

- Reverse proxy with SSL (self-signed)
- PostgreSQL database
- Automatic container updates (Watchtower)
- Centralized logging (Fluent Bit)
- Monitoring (Prometheus, Node Exporter, cAdvisor)
- Backup (PostgreSQL dump + Gitea `/data` archive)
- Infrastructure-as-Code (Idempotent, reproducible)

---

## ⚙️ Requirements

- Docker + Docker Compose
- Terraform (>= 1.0)
- Unix-based shell (Linux/macOS)

---

## 🚀 Getting Started

### 1. Clone this repo
```bash
git clone https://github.com/yournameVitmer/gitea-devops-challenge.git
cd gitea-devops-challenge