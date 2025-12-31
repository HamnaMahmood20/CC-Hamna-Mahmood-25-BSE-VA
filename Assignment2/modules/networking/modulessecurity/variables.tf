variable "vpc_id" {
  description = "The VPC ID where security groups will be created"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for resource naming"
  type        = string
  default     = "prod"
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}
