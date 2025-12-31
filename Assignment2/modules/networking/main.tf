# modules/networking/main.tf
# Create VPC
resource "aws_vpc" "a_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

# Create Subnet
resource "aws_subnet" "a_public_subnet" {
  vpc_id                  = aws_vpc.a_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env_prefix}-public-subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "a_igw" {
  vpc_id = aws_vpc.a_vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

# Create Route Table
resource "aws_route_table" "a_public_rt" {
  vpc_id = aws_vpc.a_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a_igw.id
  }
  tags = {
    Name = "${var.env_prefix}-public-rt"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "a_public_rt_assoc" {
  subnet_id      = aws_subnet.a_public_subnet.id
  route_table_id = aws_route_table.a_public_rt.id
}

