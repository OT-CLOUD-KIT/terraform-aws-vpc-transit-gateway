variable "description" {
  type        = string
  default     = "Centralized TGW for multi-VPC"
}

variable "amazon_side_asn" {
  type        = number
  default     = 4200000000
}

variable "auto_accept_shared_attachments" {
  type        = string
  default     = "enable"
}

variable "default_route_table_association" {
  type        = string
  default     = "enable"
}

variable "default_route_table_propagation" {
  type        = string
  default     = "enable"
}

variable "dns_support" {
  type        = string
  default     = "enable"
}

variable "multicast_support" {
  type        = string
  default     = "disable"
}

variable "vpn_ecmp_support" {
  type        = string
  default     = "enable"
}

variable "security_group_referencing_support" {
  type        = string
  default     = "disable"
}

variable "transit_gateway_cidr_blocks" {
  type        = list(string)
  default     = ["10.200.0.0/16"]
}

variable "tgw_route_cidr_block" {
  type        = string
  default     = "10.0.0.0/8"
}

variable "transit_gateway_name" {
  type        = string
  default     = "prod-tgw"
}

variable "vpc_attachments" {
  type = list(object({
    name                            = string
    vpc_id                          = string
    subnet_ids                      = list(string)
    route_table_id                  = optional(string)
    dns_support                     = string
    ipv6_support                    = string
    associate_with_tgw_route_table = bool
    propagate_to_tgw_route_table   = bool
  }))
  default = [
    {
      name                            = "tgw-attachment-vpc-a"
      vpc_id                          = "vpc-0b2e7e2387bf08301"
      subnet_ids                      = ["subnet-034233dfae169f63f", "subnet-07d80237e1856b427"]
      route_table_id                  = "rtb-03557993cb1fba8f4"
      dns_support                     = "enable"
      ipv6_support                    = "disable"
      associate_with_tgw_route_table = true
      propagate_to_tgw_route_table   = true
    },
    {
      name                            = "tgw-attachment-vpcB"
      vpc_id                          = "vpc-0cda6bcbeb0cc309b"
      subnet_ids                      = ["subnet-0efbb6d6ffd83edf1", "subnet-068e80c046b559f24"]
      route_table_id                  = "rtb-0eabcfe9c5f495ed7"
      dns_support                     = "enable"
      ipv6_support                    = "disable"
      associate_with_tgw_route_table = false
      propagate_to_tgw_route_table   = true
    }
  ]
}

########################## Naming Convention Inputs ##########################

variable "env" {
  type        = string
  default     = "d"
  description = "Environment short name. Must be one of: d, p, q, s, g."
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', or 'g'."
  }
}

variable "bu" {
  type        = string
  default     = "ot"
  description = "Business unit name (e.g., pcs, ultrasound). Max 10 characters."
  validation {
    condition     = length(var.bu) <= 10
    error_message = "The business unit name must be less than or equal to 10 characters."
  }
}

variable "app" {
  type        = string
  default     = "bp"
  description = "Application name. Max 10 characters."
  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 10 characters."
  }
}

variable "program" {
  type        = string
  default     = "ot"
  description = "Program name."
}

variable "resource" {
  type        = string
  default     = "database"
  description = "Resource name. Max 15 characters."
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 15 characters."
  }
}

variable "team" {
  type        = string
  default     = "infra"
  description = "Team responsible for the resource."
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region."
}

################### Optional Random Name Generator ###################

variable "random_alphanumeric_len" {
  type        = number
  default     = 4
  description = "Length of the random alphanumeric suffix."
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  type        = bool
  default     = false
  description = "Include special characters in generated names."
}

variable "upper" {
  type        = bool
  default     = false
  description = "Include uppercase letters in generated names."
}

variable "number" {
  type        = bool
  default     = true
  description = "Include numbers in generated names."
}

variable "gen_no_of_names" {
  type        = number
  default     = 1
  description = "Number of names to generate."
}

variable "create" {
  type        = bool
  default     = true
  description = "Controls whether resources should be created."
}

variable "enabled_features" {
  type        = list(string)
  default     = []
  description = "Optional features enabled for the module."
}
