**Name: Hamna Mahmood-25
**Lab Project: Frontend-Backend Nginx High Availability**

This project demonstrates the design and implementation of a **multi-tier AWS architecture** using **Terraform** and **Ansible** with a focus on **automation and role-based configuration**.

**Project Overview**

- **Infrastructure as Code (Terraform):**
  - Define VPC, public subnet, internet gateway, and routing.
  - Create security groups for SSH (port 22) and HTTP (port 80).
  - Provision EC2 instances for a frontend (Nginx) and three backend (HTTPD) servers.
  - Output public and private IPs for dynamic configuration.
- **Configuration Management (Ansible):**
  - Use **roles** to separate responsibilities:
    - frontend/ role: Install and configure Nginx as a reverse proxy/load balancer.
    - backend/ role: Install Apache HTTPD, enable service, deploy a custom index page per backend.
    - common/ role (optional): Base system setup, packages, firewall, etc.
  - Main playbook (site.yaml) applies roles to hosts based on inventory.
  - Templates dynamically insert backend private IPs into Nginx upstream configuration.
- **High Availability Setup:**
  - Nginx frontend load balances across **2 active backend HTTPD servers**.
  - A **backup backend** server is configured to serve only in case of failure.
- **Terraform-Ansible Integration:**
  - Terraform triggers Ansible automatically after EC2 instances are created.
  - Null resources with local-exec run Ansible playbooks using instance IPs from Terraform outputs.
  - No manual playbook execution is required after terraform apply.
- **Project Structure:**
- LabProject_FrontendBackend/
- ├─ main.tf, variables.tf, outputs.tf, locals.tf, terraform.tfvars
- ├─ modules/ (subnet, webserver)
- ├─ ansible/
- │ ├─ ansible.cfg
- │ ├─ inventory/hosts
- │ ├─ playbooks/site.yaml
- │ └─ roles/
- │ ├─ common/
- │ ├─ frontend/
- │ └─ backend/
- ├─ screenshots/
- ├─ Lab-Project-Frontend-Backend-Nginx-HA.md
- └─ README.md

**Key Requirements**

- Use **Terraform modules** and variables to parameterize architecture.
- **Roles must be used** for Ansible; frontend and backend roles are mandatory.
- Dynamic configuration using templates for Nginx and backend index pages.
- Security best practices: restrict SSH access to your IP, HTTP open globally.
- Full automation: running terraform apply -auto-approve provisions resources and configures them without further manual intervention.