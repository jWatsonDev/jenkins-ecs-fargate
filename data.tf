data "aws_region" "current" {}

# Curretn AWS account
data "aws_caller_identity" "this" {}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [var.aws_vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["public-*"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.aws_vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["private-*"]
  }
}