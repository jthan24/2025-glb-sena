resource "aws_vpc" "vpc-main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = merge(
    var.tags, {
      Name = "vpc-${var.proyecto}"
    }
  )
}


############### PUBLIC SUBNETS ###############

resource "aws_subnet" "subnet-publica" {
  count = length(var.cidr_public_subnets)

  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = var.cidr_public_subnets[count.index]
  availability_zone       = var.zonas_disponibilidad[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.tags, {
      Name = "subnet-pub${count.index}-${var.proyecto}"
    }
  )
}

############### PRIVATE SUBNETS ###############

resource "aws_subnet" "subnet-privada" {
  count = length(var.cidr_private_subnets)

  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_private_subnets[count.index]
  availability_zone = var.zonas_disponibilidad[count.index]

  tags = merge(
    var.tags, {
      Name = "subnet-priv${count.index}-${var.proyecto}"
    }
  )
}

############### INTERNET GATEWAY ###############

resource "aws_internet_gateway" "igw-vpc-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = merge(
    var.tags, {
      Name = "igw-${var.proyecto}"
  })
}


resource "aws_default_route_table" "rt-public-default-app" {
  default_route_table_id = aws_vpc.vpc-main.main_route_table_id

  tags = merge(
    var.tags, {
      Name = "${var.proyecto}-public-default"
  })
}

resource "aws_route_table" "rt-subnets" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-vpc-main.id
  }

  tags = merge(
    var.tags, {
      Name = "${var.proyecto}-public"
  })
}

resource "aws_route_table_association" "routetable-associate" {
  count          = length(var.cidr_public_subnets)
  subnet_id      = aws_subnet.subnet-publica[count.index].id
  route_table_id = aws_route_table.rt-subnets.id
}
