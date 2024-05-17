data "aws_region" "current" {}

data "aws_ami" "ami_lookup" {
  for_each = toset(var.versions)
  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:app"
    values = [var.appname]
  }

  filter {
    name   = "tag:version"
    values = [each.value]
  }
}

module "elastic-beanstalk-environment" {
  # https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment
  source                             = "cloudposse/elastic-beanstalk-environment/aws"
  version                            = "0.51.2"
  for_each                           = tomap(var.env_versions)
  ami_id                             = lookup(data.aws_ami.ami_lookup, each.value).id
  application_subnets                = var.application_subnets
  loadbalancer_subnets               = var.application_subnets
  elastic_beanstalk_application_name = var.appname
  region                             = data.aws_region.current.name
  solution_stack_name                = var.solution_stack_name
  vpc_id                             = var.vpc_id
  description                        = var.description
  tier                               = var.tier
  rolling_update_enabled             = var.deployment_type == "SingleInstance" ? false : true
  version_label                      = "${var.appname}-${each.value}"
  name                               = "${var.appname}-${each.key}"
  environment_type                   = var.deployment_type
  env_vars                           = var.env_vars
  depends_on = [
    aws_elastic_beanstalk_application.app,
    aws_elastic_beanstalk_application_version.version
  ]
}