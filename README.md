


export AWS_ACCESS_KEY_ID=EXAMPLE
export AWS_SECRET_ACCESS_KEY=EXAMPLE
export AWS_REGION=us-west-2


ingress {
    description = "all 8080 trafic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "all 5000 trafic"
    from_port   = 5000
    to_port     = 5000
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }