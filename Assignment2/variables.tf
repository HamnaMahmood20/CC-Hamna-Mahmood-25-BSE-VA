############################
# Networking Variables
############################
variable "my_ip"{
description="My public IP address for SSH access"
type       = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "VPC CIDR block must be a valid CIDR notation."
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr_block))
    error_message = "Subnet CIDR block must be a valid CIDR notation."
  }
}

variable "availability_zone" {
  description = "Availability zone for subnet and EC2 instances"
  type        = string
}

############################
# Environment & EC2
############################

variable "env_prefix" {
  description = "Environment prefix for resource naming (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

############################
# SSH Keys
############################

variable "public_key" {
  description = "Path to the public SSH key"
  type        = string
}

variable "private_key" {
  description = "Path to the private SSH key"
  type        = string
}

############################
# Backend Servers
############################

variable "backend_servers" {
  description = "List of backend servers with name and script path"
  type = list(object({
    name        = string
    script_path = string
  }))
}
