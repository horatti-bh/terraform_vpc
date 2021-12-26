PRIVATE_VPC_CIDR        = "10.20.0.0/16"
PUBLIC_VPC_CIDR         = "10.21.0.0/16"
bucket                  = "terrafrom_vpc"
key                     = "VPC/DEV/terraform.tfstate"
TAGS                    = {"ENV": "DEV"}
PUBLIC_SUBNETS_COUNT    = 1
PRIVATE_SUBNETS_COUNT   = 2
