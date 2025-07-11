
module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.region
  env     = var.env
}
module "transit_gateway" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-vpc-transit-gateway.git?ref=Feature"

  description                        = var.description
  amazon_side_asn                    = var.amazon_side_asn
  bu                = var.bu
  program           = var.program
  app               = var.app
  team              = var.team
  env               = var.env
  auto_accept_shared_attachments     = var.auto_accept_shared_attachments
  default_route_table_association    = var.default_route_table_association
  default_route_table_propagation    = var.default_route_table_propagation
  dns_support                        = var.dns_support
  multicast_support                  = var.multicast_support
  vpn_ecmp_support                   = var.vpn_ecmp_support
  security_group_referencing_support = var.security_group_referencing_support
  transit_gateway_cidr_blocks        = var.transit_gateway_cidr_blocks
  vpc_attachments                    = var.vpc_attachments
  tgw_route_cidr_block               = var.tgw_route_cidr_block
  transit_gateway_name               = var.transit_gateway_name
}


