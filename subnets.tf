resource "aws_subnet" "Private_subnets_dev_s1" {
  count      = var.PRIVATE_SUBNETS_COUNT
  cidr_block = cidrsubnet(var.PRIVATE_VPC_CIDR, 8, count.index)
  vpc_id     = aws_vpc.main.id
}


