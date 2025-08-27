<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.rt-public-default-app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.igw-vpc-main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.rt-subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.routetable-associate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.subnet-privada](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-publica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc-main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_proyecto"></a> [proyecto](#input\_proyecto) | nombre del proyecto | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags de los recursos | `map(any)` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | cidr block para la vpc | `string` | `"10.0.0.0/16"` | no |
| <a name="input_cidr_private_subnets"></a> [cidr\_private\_subnets](#input\_cidr\_private\_subnets) | lista de cidrs para las subnets privadas | `list(string)` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24",<br>  "10.0.6.0/24"<br>]</pre> | no |
| <a name="input_cidr_public_subnets"></a> [cidr\_public\_subnets](#input\_cidr\_public\_subnets) | lista de cidrs para las subnets publicas | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_zonas_disponibilidad"></a> [zonas\_disponibilidad](#input\_zonas\_disponibilidad) | lista de zonas de disponbilidad | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_publicas"></a> [subnets\_publicas](#output\_subnets\_publicas) | subnets publicas |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | cidr de la vpc |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | id de la vpc |
<!-- END_TF_DOCS -->