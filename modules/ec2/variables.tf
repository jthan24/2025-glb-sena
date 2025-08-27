variable "proyecto" {
  type        = string
  description = "nombre del proyecto"
}

variable "tags" {
  type        = map(any)
  description = "tags de los recursos"
}

variable "vpc" {
  type        = map(any)
  description = "informacion de la vpc"
}

variable "subnet_id" {
  type        = string
  description = "id de la subnet para los recursos"
}
