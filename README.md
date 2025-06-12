## Terraform AWS Transit-gateway

This module creates a Transit Gateway (TGW) and allows you to attach multiple VPCs with customizable route propagation and association settings.

## Architecture
![image](https://github.com/user-attachments/assets/528b2538-7f71-4fa9-b54e-a280729d4435)

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |

## Usage 

 ```hcl
module "transit_gateway" {
  source = "../"

  description                        = var.description
  amazon_side_asn                    = var.amazon_side_asn
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
  tags                               = var.tags
  transit_gateway_name               = var.transit_gateway_name
}
```



