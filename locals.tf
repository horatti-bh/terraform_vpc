locals {
  VPC_TAG_PREFIX                = lower("rs-${var.TAGS["ENV"]}-vpc")
  PUBLIC_SUBNET_TAG_PREFIX      = lower("rs-${var.TAGS["ENV"]}-public_subnet")
  PRIVATE_SUBNET_TAG_PREFIX     = lower("rs-${var.TAGS["ENV"]}-private_subnet")
  IGW_TAG_PREFIX                = lower("rs-${var.TAGS["ENV"]}-igw")
  PUBLIC_ROUTE_TABLE            = lower("rs-${var.TAGS["ENV"]}-public_rt")
  PRIVATE_ROUTE_TABLE           = lower("rs-${var.TAGS["ENV"]}-private_rt")
  PEERING_NAME                  = lower("rs-${var.TAGS["ENV"]}-peer_mgmt_vpc_to_${var.TAGS["ENV"]}_vpc")
}
