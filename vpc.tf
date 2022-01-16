resource "aws_vpc" "main" {
  cidr_block            = var.PRIVATE_VPC_CIDR
  enable_dns_hostnames  = true
  enable_dns_support    = true
  tags                  = {
    Name                = local.VPC_TAG_PREFIX
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id                = aws_vpc.main.id
  cidr_block            = var.PUBLIC_VPC_CIDR
  depends_on            = [aws_vpc.main]
}
