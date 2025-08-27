module "networking" {

  source = "./modules/network"

  proyecto = var.proyecto
  tags     = var.tags
  zonas_disponibilidad = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]

}


module "ec2" {
  source = "./modules/ec2"

  proyecto = "${var.proyecto}-ec2"
  tags     = var.tags

  vpc = {
    id         = module.networking.vpc_id
    cidr_block = module.networking.vpc_cidr
  }
  subnet_id = module.networking.subnets_publicas[0].id
}
