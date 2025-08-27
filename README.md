


export AWS_ACCESS_KEY_ID=AKIATJPZ76P4XZ5GC5RC
export AWS_SECRET_ACCESS_KEY=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
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