variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for naming resources"
  type        = string
}

variable "my_ip" {
  description = "Public IP in CIDR format"
  type        = string
}
