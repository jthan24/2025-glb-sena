variable "cidr_block" {
  type        = string
  description = "cidr block para la vpc"
  default     = "10.0.0.0/16"
}

variable "cidr_public_subnets" {
  type        = list(string)
  description = "lista de cidrs para las subnets publicas"
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "cidr_private_subnets" {
  type        = list(string)
  description = "lista de cidrs para las subnets privadas"
  default = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]
}

variable "zonas_disponibilidad" {
  type        = list(string)
  description = "lista de zonas de disponbilidad"
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "tags" {
  type        = map(any)
  description = "tags de los recursos"
}

variable "proyecto" {
  type        = string
  description = "nombre del proyecto"
}
