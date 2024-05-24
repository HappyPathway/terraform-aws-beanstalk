data "aws_region" "current" {}

data "aws_ami" "ami_lookup" {
  for_each = var.use_custom_image ? toset(var.versions) : []
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
  source                             = "HappyPathway/beanstalk-environment/aws"
  for_each                           = tomap(var.env_versions)
  ami_id                             = var.use_custom_image ? lookup(data.aws_ami.ami_lookup, each.value).id : null
  application_subnets                = var.application_subnets
  enable_loadbalancer_logs           = var.enable_loadbalancer_logs
  loadbalancer_subnets               = var.loadbalancer_subnets
  loadbalancer_security_groups       = var.loadbalancer_security_groups
  deployment_policy                  = var.deployment_policy
  elastic_beanstalk_application_name = var.appname
  region                             = data.aws_region.current.name
  solution_stack_name                = var.solution_stack_name
  vpc_id                             = var.vpc_id
  description                        = var.description
  tier                               = var.tier
  root_volume_type                   = "gp3"
  rolling_update_enabled             = var.deployment_type == "SingleInstance" ? false : true
  version_label                      = "${var.appname}-${each.value}"
  name                               = "${var.appname}-${each.key}"
  environment_type                   = var.deployment_type
  env_vars                           = merge(
    var.env_vars,
    {
      "APP_NAME" = var.appname,
      "APP_ENV"  = each.key,
      "APP_VERSION" = each.value,
      "APP_DOMAIN" = var.app_domain
    }
  )
  depends_on = [
    aws_elastic_beanstalk_application.app,
    aws_elastic_beanstalk_application_version.version
  ]
}


// create route 53 record for output of elastic-beanstalk-environment
resource aws_route53_record "environment" {
  for_each = tomap(var.env_versions)
  zone_id = var.zone_id
  name = "${var.appname}-${each.key}.${var.app_domain}"
  type = "CNAME"
  ttl = "300"
  records = [lookup(module.elastic-beanstalk-environment, each.key).endpoint]
}