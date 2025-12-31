
module "networking" {
  source           = "./modules/networking"
  vpc_cidr_block   = var.vpc_cidr_block
  subnet_cidr_block= var.subnet_cidr_block
  availability_zone= var.availability_zone
  env_prefix       = var.env_prefix
}
module "security" {
  source     = "./modules/security"
  vpc_id     = module.networking.vpc_id
  env_prefix = var.env_prefix
  my_ip      = var.my_ip
}
provider "aws"{
region="me-central-1"
}
# Nginx Server
module "nginx_server" {
  source            = "./modules/webserver"

  env_prefix        = var.env_prefix
  instance_name     = "nginx-proxy"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.nginx_sg_id

  public_key        = var.public_key
  script_path       = "./scripts/nginx-setup.sh"
  instance_suffix   = "nginx"

  common_tags       = local.common_tags
ami_id = "ami-0163b72cf979add27"
}
# Backend Servers
module "backend_servers" {
  for_each = {
    for server in local.backend_servers :
    server.name => server
  }

  source            = "./modules/webserver"

  env_prefix        = var.env_prefix
  instance_name     = each.value.name
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.backend_sg_id

  public_key        = var.public_key
  script_path       = each.value.script_path
  instance_suffix   = each.value.suffix

  common_tags       = local.common_tags
ami_id= "ami-0163b72cf979add27"
}
output "backend_public_ips" {
  value = { for name, mod in module.backend_servers : name => mod.public_ip }
}
