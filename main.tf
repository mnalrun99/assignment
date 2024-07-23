module "vpc" {
  source = "./vpc"
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  }
resource "aws_key_pair" "aws_key" {
  key_name = "ansible-ssh-key"
  public_key = tls_private_key.key.public_key_openssh
  }

resource "aws_instance" "vm" {
  count         = 5
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.aws_key.key_name
  subnet_id     = module.vpc.public_subnet_id
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]

  tags = {
    Name = "vm${count.index + 1}"
  }
}
