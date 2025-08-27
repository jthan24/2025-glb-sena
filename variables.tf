variable "proyecto" {
  type        = string
  description = "nombre del proyecto"
}

variable "tags" {
  type        = map(any)
  description = "tags de los recursos"
}
