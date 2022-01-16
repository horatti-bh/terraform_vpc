resource "aws_route53_zone_association" "secondary" {
  zone_id = data.terraform_remote_state.route53.outputs.PRIVATE_HOSTED_ZONE_ID
  vpc_id  = aws_vpc.main.id
}
