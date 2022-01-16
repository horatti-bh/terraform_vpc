data "aws_vpc" "mgmt" {
  id = var.MGMT_VPC_ID
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "terraform_remote_state" "route53" {
  backend = "s3"
  config = {
    bucket = var.bucket
    key    = "roboshop/route53/terraform.tfstate"
    region = "us-east-1"
  }
}
