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
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock_check"
    access_key = "AKIA6QO5WSPDRYJ2VK7V"
    secret_key = "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"
  }
}
