resource "aws_s3_bucket" "created" {
  var.create_bucket ? 1 : 0
  bucket = var.bucket_name
}

data "aws_s3_bucket" "selected" {
  var.create_bucket ? 0 : 1
  bucket = var.bucket_name
}

locals {
  bucket = var.create_bucket ? one(aws_s3_bucket.created) : one(data.aws_s3_bucket.selected)
}

resource "aws_s3_object" "default" {
  count = var.deploy_source ? 1 : 0
  bucket = aws_s3_bucket.default.id
  key    = "${var.appname}-${var.version}.zip"
  source = "${var.appname}-${var.version}.zip"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = var.appname
  description = var.description
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "${var.appname}-${var.version}"
  application = var.appname
  description = var.appversion_description
  bucket      = local.bucket.id
  key         = "${var.appname}-${var.version}.zip"
}
