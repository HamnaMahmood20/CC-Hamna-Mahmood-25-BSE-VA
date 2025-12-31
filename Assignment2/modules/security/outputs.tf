output "nginx_sg_id" {
  value = aws_security_group.a_nginx_sg.id
}

output "backend_sg_id" {
  value = aws_security_group.a_backend_sg.id
}

