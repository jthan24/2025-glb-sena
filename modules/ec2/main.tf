resource "aws_security_group" "security-group80" {
  name        = "securitygroup_ap-80-${var.proyecto}"
  description = "securitygroup para la instancia ec2"
  vpc_id      = var.vpc.id
  ingress {
    description = "all 80 trafic"
    from_port   = 80
    to_port     = 80
    protocol    = "all"
    cidr_blocks = [var.vpc.cidr_block]
  }

  tags = merge(
    var.tags, {
      Name = "sg-ec2-${var.proyecto}",
      name = "sg-ec2-${var.proyecto}"
    }
  )
}


resource "aws_security_group" "security-group" {
  name        = "securitygroup_app-${var.proyecto}"
  description = "securitygroup para la instancia ec2"
  vpc_id      = var.vpc.id
  ingress {
    description = "all trafic from vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.tags, {
      Name = "sg-ec2-${var.proyecto}",
      name = "sg-ec2-${var.proyecto}"
    }
  )
}

resource "aws_instance" "instancia-app" {
  ami                    = "ami-01102c5e8ab69fb75"
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.instance-prof-app.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  subnet_id              = var.subnet_id
  tags = merge(
    var.tags, {
      Name = "ec2-${var.proyecto}",
      name = "ec2-${var.proyecto}"
    }
  )
}
