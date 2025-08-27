

```bash
export AWS_ACCESS_KEY_ID=example
export AWS_SECRET_ACCESS_KEY=example
export AWS_REGION=us-west-2
```

```terraform
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
```