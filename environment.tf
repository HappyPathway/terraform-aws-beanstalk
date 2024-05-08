data "aws_region" "current" {}

module "elastic-beanstalk-environment" {
  # https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment
  source                             = "cloudposse/elastic-beanstalk-environment/aws"
  version                            = "0.51.2"
  application_subnets                = var.application_subnets
  elastic_beanstalk_application_name = var.appname
  region                             = data.aws_region.current.name
  solution_stack_name                = var.solution_stack_name
  vpc_id                             = var.vpc_id
}