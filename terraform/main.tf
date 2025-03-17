provider "aws" {
  region = "us-east-1"
}

# Generate SSH key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "builder_key" {
  key_name   = "michael-builder-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Save private key to file
resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/michael-builder-key.pem"
  file_permission = "0600"
}

# Security group
resource "aws_security_group" "builder_sg" {
  name        = "michael-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = "vpc-044604d0bfb707142"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "michael-sg"
  }
}

# EC2 instance
resource "aws_instance" "builder" {
  ami                    = "ami-084568db4383264d4" # Ubuntu AMI
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.builder_key.key_name
  vpc_security_group_ids = [aws_security_group.builder_sg.id]
  
  tags = {
    Name = "michael-builder"
  }
}

# connect to the instance
# ssh -i ./michael-builder-key.pem ubuntu@44.204.165.207