output "PUBLIC_SUBNET_IDS" {
  value = aws_subnet.public-subnets.*.id
}

output "PRIVATE_SUBNET_IDS" {
  value = aws_subnet.private-subnets.*.id
}

output "VPC_ID" {
  value = aws_vpc.main.id
}

output "MGMT_VPC_ID" {
  value = var.MGMT_VPC_ID
}

output "MGMT_VPC_CIDR" {
  value = data.aws_vpc.mgmt.cidr_block
}

output "PUBLIC_VPC_CIDR" {
  value = var.PUBLIC_VPC_CIDR
}

output "PRIVATE_VPC_CIDR" {
  value = var.PRIVATE_VPC_CIDR
}
