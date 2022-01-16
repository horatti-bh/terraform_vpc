resource "aws_route_table" "public-route-table" {
  vpc_id                        = aws_vpc.main.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.igw.id
  }

  route {
    cidr_block                  = data.aws_vpc.mgmt.cidr_block
    vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name                        = local.PUBLIC_ROUTE_TABLE
  }
}

resource "aws_route_table_association" "public-rt-assoc" {
  count                         = var.PUBLIC_SUBNETS_COUNT
  subnet_id                     = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id                = aws_route_table.public-route-table.id
}

resource "aws_route_table" "private-route-table" {
  vpc_id                        = aws_vpc.main.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.ngw.id
  }

  route {
    cidr_block                  = data.aws_vpc.mgmt.cidr_block
    vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name                        = local.PRIVATE_ROUTE_TABLE
  }
}

resource "aws_route_table_association" "private-rt-assoc" {
  count                         = var.PRIVATE_SUBNETS_COUNT
  subnet_id                     = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id                = aws_route_table.private-route-table.id
}

resource "aws_route" "route1" {
  route_table_id                = var.MGMT_ROUTE_TABLE
  destination_cidr_block        = var.PRIVATE_VPC_CIDR
  vpc_peering_connection_id     = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "route2" {
  route_table_id                = var.MGMT_ROUTE_TABLE
  destination_cidr_block        = var.PUBLIC_VPC_CIDR
  vpc_peering_connection_id     = aws_vpc_peering_connection.peer.id
}
