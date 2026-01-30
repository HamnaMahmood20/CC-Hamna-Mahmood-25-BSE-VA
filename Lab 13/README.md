# Lab 13 – Terraform IAM Management with AWS

## Overview
This lab demonstrates how to manage AWS IAM resources using **Terraform** inside a **GitHub Codespace**. It focuses on creating IAM groups and users, attaching managed policies, handling login profiles and access keys, and managing Terraform state securely.

## Objectives
- Use GitHub CLI and Codespaces as the development environment
- Create and manage IAM groups and users with Terraform
- Attach AWS managed policies to IAM groups
- Create IAM login profiles using Terraform provisioners
- Generate and manage IAM access keys
- Create multiple IAM users dynamically from CSV files
- Implement Terraform remote state using an S3 backend
- Practice Terraform cleanup and state verification

## Tools & Technologies
- AWS IAM
- Terraform
- GitHub CLI
- GitHub Codespaces
- Bash scripting
- AWS CLI

## Key Tasks Completed
- IAM group creation and output handling
- IAM user creation with group membership
- Policy attachment to IAM groups
- Login profile creation via `null_resource`
- Access key generation and verification
- Remote Terraform state configuration using S3
- Automated IAM user creation from CSV input
- Resource cleanup using `terraform destroy`

## Notes
- All work was performed inside a GitHub Codespace
- No secrets or sensitive credentials were committed
- Terraform state was managed securely

## Author
Hamna Mahmood
2023-BSE-025
