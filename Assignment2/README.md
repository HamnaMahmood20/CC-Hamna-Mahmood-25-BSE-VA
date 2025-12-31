
---

## Project Structure

```text
Assignment2/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── terraform.tfvars.example
├── .gitignore
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── webserver/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── scripts/
│   ├── nginx-setup.sh
│   └── apache-setup.sh
├── screenshots/
│   ├── part1/
│   ├── part2/
│   ├── part3/
│   ├── part4/
│   ├── part5/
│   ├── part6/
│   └── bonus/
└── docs/
    ├── architecture.md
    └── troubleshooting.md

