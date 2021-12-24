resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR
}
tags = {
  Name = var.TAGS["ENV"]
}

resource "aws_subnet" "dev_s1" {
  cidr_block = var.VPC_CIDR
  vpc_id     = aws_vpc.main.id
}

variable "VPC_CIDR" {}
variable "key" {}
variable "bucket" {}
variable "TAGS" {}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    region = "us-east-1"
    dynamodb_table = "terraform"
  }
}

output "SUBNET_ID" {
  value = "aws_subnet.dev_s1.id"
}
