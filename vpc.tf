resource "aws_vpc" "main" {
  cidr_block = var.PRIVATE_VPC_CIDR
  tags       = {
    Name = var.TAGS["ENV"]
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_VPC_CIDR
}