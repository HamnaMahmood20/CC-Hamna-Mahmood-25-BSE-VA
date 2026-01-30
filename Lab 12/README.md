# Lab 12 – Terraform Provisioners, Modules & Nginx Reverse Proxy / Load Balancer

## Overview
This lab focuses on building AWS infrastructure using **Terraform** inside a **GitHub Codespace**, with emphasis on provisioners, reusable modules, and advanced **Nginx** configurations including HTTPS, reverse proxying, load balancing, caching, and high availability.

## Objectives
- Use GitHub CLI and Codespaces as the development environment
- Organize Terraform configuration into best-practice files
- Practice Terraform provisioners:
  - `user_data`
  - `remote-exec`
  - `file`
  - `local-exec`
- Create reusable Terraform modules (subnet & webserver)
- Deploy and configure Nginx on EC2 instances
- Implement HTTPS using self-signed SSL certificates
- Configure Nginx as:
  - Reverse proxy
  - Load balancer
  - High-availability server with backups
  - Caching layer for performance

## Tools & Technologies
- Terraform
- AWS EC2, VPC, Security Groups
- GitHub CLI
- GitHub Codespaces
- Nginx
- Bash scripting
- OpenSSL

## Key Tasks Completed
- Modular Terraform project structure (`main.tf`, `variables.tf`, `outputs.tf`, etc.)
- EC2 provisioning using different Terraform provisioners
- Creation and usage of reusable Terraform modules
- Automated Nginx installation and configuration
- HTTPS setup with self-signed SSL certificates
- Nginx reverse proxy to backend servers
- Nginx load balancing with backup servers
- High availability and caching configuration
- Complete resource cleanup using `terraform destroy`

## Notes
- All tasks were executed inside a GitHub Codespace
- No secrets or private keys were committed
- Terraform state was managed locally for this lab
- HTTPS warnings are expected due to self-signed certificates

## Author
Hamna Mahmood
2023-BSE-025
BSE V-A
