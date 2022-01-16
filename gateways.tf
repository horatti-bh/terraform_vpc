resource "aws_internet_gateway" "igw" {
  vpc_id        = aws_vpc.main.id

  tags = {
    Name        = local.IGW_TAG_PREFIX
  }
}

resource "aws_eip" "ngw" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public-subnets.0.id
}
