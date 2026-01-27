**Name: Hamna Mahmood  
Roll Number: 25  
README.md of Project**

This project demonstrates building a \*\*multi-tier AWS architecture\*\* with automated configuration using \*\*Terraform\*\* and \*\*Ansible\*\*. It sets up a frontend Nginx server as a \*\*reverse proxy/load balancer\*\* and multiple backend HTTPD servers, with high availability and role-based configuration.

\## Features

\- \*\*Terraform Infrastructure\*\*

\- VPC, public subnet, internet gateway, routing.

\- Security groups (SSH restricted, HTTP open).

\- EC2 instances for frontend (Nginx) and backend (HTTPD) servers.

\- Outputs include public and private IPs for dynamic configuration.

\- \*\*Ansible Configuration\*\*

\- Role-based structure for separation of concerns:

\- \`frontend/\` - Nginx load balancer with backend upstream configuration.

\- \`backend/\` - Apache HTTPD installation and custom index page per host.

\- \`common/\` - Optional base configuration.

\- Templates dynamically generate configurations using backend private IPs.

\- Main playbook (\`site.yaml\`) applies all roles automatically.

\- \*\*High Availability\*\*

\- 2 active backend servers, 1 backup backend server.

\- Nginx forwards traffic to active backends and uses backup on failure.

\- \*\*Automation\*\*

\- Terraform triggers Ansible automatically after EC2 provisioning.

\- Running \`terraform apply -auto-approve\` fully deploys infrastructure and configures servers.

\## Project Structure

LabProject_FrontendBackend/

├─ main.tf, variables.tf, outputs.tf, locals.tf, terraform.tfvars

├─ modules/ (subnet, webserver)

├─ ansible/

│ ├─ ansible.cfg

│ ├─ inventory/hosts

│ ├─ playbooks/site.yaml

│ └─ roles/

│ ├─ common/

│ ├─ frontend/

│ └─ backend/

├─ screenshots/

├─ Lab-Project-Frontend-Backend-Nginx-HA.md

└─ README.md

\## Usage

1\. \*\*Set up AWS key pair\*\* in \`terraform.tfvars\`.

2\. \*\*Apply Terraform\*\*:

\`\`\`bash

terraform init

terraform apply -auto-approve

Terraform will automatically run Ansible playbooks to configure all servers.

Access the frontend Nginx load balancer via its public IP.

Notes

Use roles in Ansible to maintain modularity and readability.

Inventory can be static (recommended) or generated dynamically from Terraform outputs.

Security best practices: SSH restricted to your IP, HTTP open globally.