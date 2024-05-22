resource "aws_s3_bucket" "created" {
  count  = var.create_bucket ? 1 : 0
  bucket = var.bucket_name
}

data "aws_s3_bucket" "selected" {
  count  = var.create_bucket ? 0 : 1
  bucket = var.bucket_name
}

locals {
  bucket = var.create_bucket ? one(aws_s3_bucket.created) : one(data.aws_s3_bucket.selected)
}

data "archive_file" "init" {
  for_each    = var.archive_source_directory ? toset(var.versions) : []
  type        = "zip"
  source_dir  = "${var.source_directory}/${each.value}"
  output_path = "${var.source_directory}/${each.value}/${var.appname}-${each.value}.zip"
}

resource "aws_s3_object" "default" {
  for_each = var.deploy_source ? toset(var.versions) : []
  bucket   = local.bucket.id
  key      = "${var.appname}-${each.value}.zip"
  source   = "${var.source_directory}/${each.value}/${var.appname}-${each.value}.zip"
}

resource "aws_elastic_beanstalk_application" "app" {
  count       = var.deploy_app ? 1 : 0
  name        = var.appname
  description = var.description
  tags        = var.app_tags
  dynamic "appversion_lifecycle" {
    for_each = var.service_role_arn != null ? ["*"] : []
    content {
      service_role          = var.service_role_arn
      max_count             = var.max_count
      max_age_in_days       = var.max_age_in_days
      delete_source_from_s3 = var.delete_source_from_s3
    }
  }
}

locals {
  app_version_tags = {
    for version in var.versions : version => merge(var.app_tags, lookup(var.app_version_tags, version, {}))
  }
}

resource "aws_elastic_beanstalk_application_version" "version" {
  for_each    = toset(var.versions)
  name        = "${var.appname}-${each.value}"
  application = var.appname
  description = var.appversion_description
  bucket      = local.bucket.id
  key         = "${var.appname}-${each.value}.zip"
  tags        = lookup(local.app_version_tags, each.value)
  depends_on = [
    aws_elastic_beanstalk_application.app

  ]

}
