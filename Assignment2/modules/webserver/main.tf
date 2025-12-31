# Create key pair
resource "aws_key_pair" "web" {
  key_name   = "${var.instance_name}-${var.instance_suffix}-key"
  public_key = file(var.public_key)
}

# Create EC2 instance
resource "aws_instance" "web" {
  ami                    = "ami-0163b72cf979add27"
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.web.key_name
  associate_public_ip_address = true
  user_data              = file(var.script_path)

  tags = merge(
    var.common_tags,
    {
      Name = "${var.env_prefix}-${var.instance_name}-${var.instance_suffix}"
    }
  )
}
