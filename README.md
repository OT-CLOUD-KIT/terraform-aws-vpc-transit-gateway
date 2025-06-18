## Terraform AWS Transit-gateway

This module creates a Transit Gateway (TGW) and allows you to attach multiple VPCs with customizable route propagation and association settings.

## Architecture
![transit_gateway drawio](https://github.com/user-attachments/assets/3be7cced-36ef-4267-9498-0f3cd5797f63)<?xml version="1.0" encoding="UTF-8"?>


## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

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

> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.

> **Related Module:**  
> If you're looking for a production-ready VPC setup with best practices (CIDR structure, subnets, route tables, flow logs, tagging, etc.), check out our  
> [Terraform AWS Network Skeleton](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton)


## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_vpc_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |


---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amazon_side_asn"></a> [amazon_side_asn](#input_amazon_side_asn) | ASN for the Amazon side of the TGW | `number` | `4200000000` | no |
| <a name="input_auto_accept_shared_attachments"></a> [auto_accept_shared_attachments](#input_auto_accept_shared_attachments) | Automatically accept shared attachments | `string` | `"enable"` | no |
| <a name="input_default_route_table_association"></a> [default_route_table_association](#input_default_route_table_association) | Automatically associate TGW route tables | `string` | `"enable"` | no |
| <a name="input_default_route_table_propagation"></a> [default_route_table_propagation](#input_default_route_table_propagation) | Automatically propagate to TGW route tables | `string` | `"enable"` | no |
| <a name="input_dns_support"></a> [dns_support](#input_dns_support) | Enable DNS support for TGW | `string` | `"enable"` | no |
| <a name="input_transit_gateway_cidr_blocks"></a> [transit_gateway_cidr_blocks](#input_transit_gateway_cidr_blocks) | List of CIDR blocks assigned to the TGW | `list(string)` | `["10.200.0.0/16"]` | no |
| <a name="input_transit_gateway_name"></a> [transit_gateway_name](#input_transit_gateway_name) | Name tag for the TGW | `string` | `"prod-tgw"` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Common tags applied to all TGW resources | `map(string)` | `{ Environment = "prod", Owner = "Nikita" }` | no |
| <a name="input_tgw_route_cidr_block"></a> [tgw_route_cidr_block](#input_tgw_route_cidr_block) | Global CIDR block for adding TGW routes | `string` | `"10.0.0.0/8"` | yes |
| <a name="input_vpc_attachments"></a> [vpc_attachments](#input_vpc_attachments) | List of VPC attachments with details | `list(object)` | `[]` | yes |
| <a name="input_attachment_name"></a> [`name`](#input_attachment_name) | Name of the TGW VPC attachment | `string` |tgw-attachment-vpc-a|yes|
| <a name="input_attachment_vpc_id"></a> [`vpc_id`](#input_attachment_vpc_id) | VPC ID to attach to the TGW | `string` |vpc-0b2e7e2387bf08301|yes|
| <a name="input_attachment_subnet_ids"></a> [`subnet_ids`](#input_attachment_subnet_ids) | List of subnet IDs used for TGW attachment (must be in different AZs) | `list(string)` |- | yes|
| <a name="input_attachment_route_table_id"></a> [`route_table_id`](#input_attachment_route_table_id) | Route table ID to which TGW routes will be added | `string` | -|yes|
| <a name="input_attachment_dns_support"></a> [`dns_support`](#input_attachment_dns_support) | Enable or disable DNS support for attachment | `string` |- | yes|
| <a name="input_attachment_ipv6_support"></a> [`ipv6_support`](#input_attachment_ipv6_support) | Enable or disable IPv6 support | `string` |- | yes|
| <a name="input_attachment_associate"></a> [`associate_with_tgw_route_table`](#input_attachment_associate) | Whether to associate this attachment with the TGW route table | `bool` |- |yes|
| <a name="input_attachment_propagate"></a> [`propagate_to_tgw_route_table`](#input_attachment_propagate) | Whether to propagate routes to the TGW route table | `bool` | - | yes|


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_transit_gateway_id"></a> [`transit_gateway_id`](#output_transit_gateway_id) | The ID of the created Transit Gateway |
| <a name="output_vpc_attachment_ids"></a> [`vpc_attachment_ids`](#output_vpc_attachment_ids) | A map of VPC attachment names to their TGW attachment IDs |


---

## Considerations

- Ensure VPCs, subnets, and route tables exist **before applying** this module.
- Validate that **subnet IDs are correct** and belong to the specified VPC.

## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)
