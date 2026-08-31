resource "aws_instance" "myinstance" {
  for_each = var.instances
  ami                         = var.ami
  instance_type               = each.value.instance_type
  key_name                    = aws_key_pair.mykey.key_name
  associate_public_ip_address = true
  # for 3 instance
  # count = 3
  vpc_security_group_ids = [
    aws_security_group.mysecurity.id
  ]

  user_data = file("install-nginx.sh")

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    name = each.key
  }
}

resource "aws_key_pair" "mykey" {
  key_name   = "terra-key"
  public_key = file("C:/Users/anshkatiyar/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "mysecurity" {

  dynamic "ingress" {

    for_each = [22,80,443,8080]
    iterator = port
    content {
      to_port     = port.value
      from_port   = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   description = "SSH"
  #   to_port     = 22
  #   from_port   = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "HTTP"
  #   to_port     = 80
  #   from_port   = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "HTTPS"
  #   to_port     = 443
  #   from_port   = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    to_port     = "0"
    from_port   = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
