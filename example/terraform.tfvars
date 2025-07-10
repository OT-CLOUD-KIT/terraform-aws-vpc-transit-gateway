description                        = "Centralized TGW for multi-VPC"
amazon_side_asn                    = 4200000000
auto_accept_shared_attachments     = "enable"
default_route_table_association    = "enable"
default_route_table_propagation    = "enable"
dns_support                        = "enable"
multicast_support                  = "disable"
vpn_ecmp_support                   = "enable"
security_group_referencing_support = "disable"
transit_gateway_cidr_blocks        = ["10.200.0.0/16"]
transit_gateway_name               = "prod-tgw"
region  = "us-east-1"

tgw_route_cidr_block = "10.0.0.0/8" # Global CIDR block for routing entries

  # -------- Attachment 1: VPC-A Details--------

vpc_attachments = [
  {
    name                           = "tgw-attachment-vpc-a"
    vpc_id                         = "vpc-0b2e7e2387bf08301"
    subnet_ids                     = ["subnet-034233dfae169f63f", "subnet-07d80237e1856b427"]
    route_table_id                 = "rtb-03557993cb1fba8f4"
    dns_support                    = "enable"
    ipv6_support                   = "disable"
    associate_with_tgw_route_table = true
    propagate_to_tgw_route_table   = true
  },
    # -------- Attachment 2: VPC-B Details --------

  {
    name                           = "tgw-attachment-vpcB"
    vpc_id                         = "vpc-0cda6bcbeb0cc309b"
    subnet_ids                     = ["subnet-0efbb6d6ffd83edf1", "subnet-068e80c046b559f24"]
    route_table_id                 = "rtb-0eabcfe9c5f495ed7"
    dns_support                    = "enable"
    ipv6_support                   = "disable"
    associate_with_tgw_route_table = false
    propagate_to_tgw_route_table   = true
  }
]

################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "database"

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot"