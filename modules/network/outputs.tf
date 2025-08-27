output "vpc_id" {
  value       = aws_vpc.vpc-main.id
  description = "id de la vpc"
}

output "vpc_cidr" {
  value       = var.cidr_block
  description = "cidr de la vpc"
}

output "subnets_publicas" {
  value       = aws_subnet.subnet-publica
  description = "subnets publicas"
}
