data "aws_region" "current" {}

module "elastic-beanstalk-environment" {
  # https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment
  source                             = "cloudposse/elastic-beanstalk-environment/aws"
  version                            = "0.51.2"
  for_each                           = tomap(var.env_versions)
  application_subnets                = var.application_subnets
  loadbalancer_subnets               = var.application_subnets
  elastic_beanstalk_application_name = var.appname
  region                             = data.aws_region.current.name
  solution_stack_name                = var.solution_stack_name
  vpc_id                             = var.vpc_id
  description                        = var.description
  tier                               = var.tier
  version_label                      = "${var.appname}-${each.value}"
  name                               = "${var.appname}-${each.key}"
}