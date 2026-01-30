README.md of Lab 14
# Lab 14 – Terraform + Ansible Automation

## Overview
This lab demonstrates infrastructure provisioning and configuration management using **Terraform** and **Ansible** inside a **GitHub Codespace**.  
AWS EC2 instances are provisioned with Terraform and configured using Ansible playbooks and roles.

All work was performed inside a **GitHub Codespace (Linux)** as required.

---

## Tools & Technologies
- GitHub Codespaces + GH CLI
- AWS CLI
- Terraform
- Ansible (ansible-core)
- AWS EC2
- Docker & Docker Compose
- Nginx, PHP, Gitea

---

## Objectives Achieved
- Provision EC2 instances and security groups using Terraform
- Configure static and dynamic Ansible inventories
- Install and configure Nginx with HTTPS (self-signed SSL)
- Deploy a PHP web application using Ansible roles
- Install Docker and Docker Compose via Ansible
- Deploy Gitea using Docker containers
- Automate Ansible execution from Terraform using `null_resource`
- Organize Ansible code using reusable roles (`nginx`, `ssl`, `webapp`)

---

## Project Structure
Lab14/
├── ansible/
│ ├── roles/
│ │ ├── nginx/
│ │ ├── ssl/
│ │ └── webapp/
│ ├── inventory/
│ └── ansible.cfg
├── main.tf
├── variables.tf
├── outputs.tf
├── my-playbook.yaml
├── compose.yaml
├── hosts
├── screenshots/
└── README.md


---

## Execution Summary
1. Terraform initializes and provisions AWS infrastructure
2. SSH keys are generated and used for EC2 access
3. Ansible inventories (static & dynamic) manage EC2 hosts
4. Nginx, SSL, PHP, Docker, and Gitea are deployed via Ansible
5. Terraform triggers Ansible automatically using `null_resource`

---

## Notes
- No secrets, private keys, or Terraform state files are committed
- All AWS and GitHub authentication was done inside the Codespace
- Screenshots for each task are included in the `screenshots/` directory

---

## Author
**Hamna Mahmood**  
BS Software Engineering  
Cloud Computing Lab
