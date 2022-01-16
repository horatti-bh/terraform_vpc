resource "aws_subnet" "private-subnets" {
  count               = var.PRIVATE_SUBNETS_COUNT
  cidr_block          = cidrsubnet(var.PRIVATE_VPC_CIDR, 8, count.index)
  vpc_id              = aws_vpc.main.id
  availability_zone   = element(data.aws_availability_zones.available.names, count.index)
  tags                = {
    Name              = "${local.PRIVATE_SUBNET_TAG_PREFIX}-${count.index+1}"
  }
}

resource "aws_subnet" "public-subnets" {
  depends_on          = [aws_vpc_ipv4_cidr_block_association.secondary_cidr]
  count               = var.PUBLIC_SUBNETS_COUNT
  cidr_block          = cidrsubnet(var.PUBLIC_VPC_CIDR, 8, count.index)
  vpc_id              = aws_vpc.main.id
  availability_zone   = element(data.aws_availability_zones.available.names, count.index)
  tags                = {
    Name              = "${local.PUBLIC_SUBNET_TAG_PREFIX}-${count.index+1}"
  }
}
