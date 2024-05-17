# # Required Variables:  [
# #     "appname",
# #     "appversion_description",
# #     "bucket_name",
# #     "create_bucket",
# #     "deploy_source",
# #     "description",
# #     "version"
# # ]
variable "appname" {
  type        = string
  description = "Name of App"
}

variable "description" {
  type        = string
  description = "App description"
}

variable "appversion_description" {
  type        = string
  description = "Version Description"
}

variable "bucket_name" {
  type        = string
  description = "Name of source code bucket"
}

variable "create_bucket" {
  type        = bool
  description = "Should we create the bucket, or does it already exist?"
  default     = false
}

variable "deploy_source" {
  type        = bool
  description = "Are we deploying the version to S3, or is it already there?"
  default     = true
}

variable "deployment_type" {
  default = "SingleInstance"
  type    = string
}

variable "versions" {
  type        = list(string)
  description = "App Versions"
}

variable "source_directory" {
  default     = "."
  type        = string
  description = "Source Code Directory containing zipped archives of versioned source code"
}

variable "app_tags" {
  default     = {}
  type        = map(string)
  description = "Application Tags"
}

variable "app_version_tags" {
  default     = {}
  type        = map(map(string))
  description = "Version Specific Tags. Overrides App Tags for the specific version"
}

variable "service_role_arn" {
  default = null
  type    = string
}

variable "max_count" {
  default = null
  type    = number
}

variable "max_age_in_days" {
  default = null
  type    = number
}

variable "delete_source_from_s3" {
  default = false
  type    = bool
}

variable "solution_stack_name" {}


# variable "additional_settings" {
#   type = list(object({
#     namespace = string
#     name      = string
#     value     = string
#   }))

#   default     = []
#   description = "Additional Elastic Beanstalk setttings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html"
# }


variable "ami_owner" {
  type        = string
  default     = "self"
  description = "AMI Owner"
}

# variable "application_port" {
#   type        = number
#   default     = 80
#   description = "Port application is listening on"
# }

variable "application_subnets" {
  type        = list(string)
  description = "List of subnets to place EC2 instances"
}

# variable "associate_public_ip_address" {
#   type        = bool
#   default     = false
#   description = "Whether to associate public IP addresses to the instances"
# }

# variable "associated_security_group_ids" {
#   type        = list(string)
#   default     = []
#   description = <<-EOT
#     A list of IDs of Security Groups to associate the created resource with, in addition to the created security group.
#     These security groups will not be modified and, if `create_security_group` is `false`, must have rules providing the desired access.
#     EOT
# }

# variable "autoscale_lower_bound" {
#   type        = number
#   default     = 20
#   description = "Minimum level of autoscale metric to remove an instance"
# }

# variable "autoscale_lower_increment" {
#   type        = number
#   default     = -1
#   description = "How many Amazon EC2 instances to remove when performing a scaling activity."
# }

# variable "autoscale_max" {
#   type        = number
#   default     = 3
#   description = "Maximum instances to launch"
# }

# variable "autoscale_measure_name" {
#   type        = string
#   default     = "CPUUtilization"
#   description = "Metric used for your Auto Scaling trigger"
# }

# variable "autoscale_min" {
#   type        = number
#   default     = 2
#   description = "Minumum instances to launch"
# }

# variable "autoscale_statistic" {
#   type        = string
#   default     = "Average"
#   description = "Statistic the trigger should use, such as Average"
# }

# variable "autoscale_unit" {
#   type        = string
#   default     = "Percent"
#   description = "Unit for the trigger measurement, such as Bytes"
# }

# variable "autoscale_upper_bound" {
#   type        = number
#   default     = 80
#   description = "Maximum level of autoscale metric to add an instance"
# }

# variable "autoscale_upper_increment" {
#   type        = number
#   default     = 1
#   description = "How many Amazon EC2 instances to add when performing a scaling activity"
# }

# variable "availability_zone_selector" {
#   type        = string
#   default     = "Any 2"
#   description = "Availability Zone selector"
# }

variable "deploy_app" {
  type    = bool
  default = false
}

# variable "deployment_batch_size_type" {
#   type        = string
#   default     = "Fixed"
#   description = "The type of number that is specified in deployment_batch_size_type"
# }

# variable "deployment_batch_size" {
#   type        = number
#   default     = 1
#   description = "Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group on which to simultaneously perform deployments. Valid values vary per deployment_batch_size_type setting"
# }

# variable "deployment_ignore_health_check" {
#   type        = bool
#   default     = false
#   description = "Do not cancel a deployment due to failed health checks"
# }

# variable "deployment_policy" {
#   type        = string
#   default     = "Rolling"
#   description = "Use the DeploymentPolicy option to set the deployment type. The following values are supported: `AllAtOnce`, `Rolling`, `RollingWithAdditionalBatch`, `Immutable`, `TrafficSplitting`"
# }

# variable "deployment_timeout" {
#   type        = number
#   default     = 600
#   description = "Number of seconds to wait for an instance to complete executing commands"
# }

# variable "elb_scheme" {
#   type        = string
#   default     = "public"
#   description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
# }

# variable "elb_logs_bucket" {
#   type    = string
#   default = null
# }

# variable "enable_capacity_rebalancing" {
#   type        = bool
#   default     = false
#   description = "Specifies whether to enable the Capacity Rebalancing feature for Spot Instances in your Auto Scaling Group"
# }

# variable "enable_loadbalancer_logs" {
#   type        = bool
#   default     = true
#   description = "Whether to enable Load Balancer Logging to the S3 bucket."
# }

# variable "enable_log_publication_control" {
#   type        = bool
#   default     = false
#   description = "Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application"
# }

# variable "enable_spot_instances" {
#   type        = bool
#   default     = false
#   description = "Enable Spot Instance requests for your environment"
# }

# variable "enable_stream_logs" {
#   type        = bool
#   default     = false
#   description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment"
# }

# variable "enhanced_reporting_enabled" {
#   type        = bool
#   default     = true
#   description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
# }

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of custom ENV variables to be provided to the application running on Elastic Beanstalk, e.g. env_vars = { DB_USER = 'admin' DB_PASS = 'xxxxxx' }"
}

variable "env_versions" {
  type = map(string)
}

# variable "environment_type" {
#   type        = string
#   default     = "LoadBalanced"
#   description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
# }

# variable "health_streaming_delete_on_terminate" {
#   type        = bool
#   default     = false
#   description = "Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days."
# }

# variable "health_streaming_enabled" {
#   type        = bool
#   default     = false
#   description = "For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system."
# }

# variable "health_streaming_retention_in_days" {
#   type        = number
#   default     = 7
#   description = "The number of days to keep the archived health data before it expires."
# }

# variable "healthcheck_healthy_threshold_count" {
#   type        = number
#   default     = 3
#   description = "The number of consecutive successful requests before Elastic Load Balancing changes the instance health status"
# }

# variable "healthcheck_httpcodes_to_match" {
#   type        = list(string)
#   default     = ["200"]
#   description = "List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer"
# }

# variable "healthcheck_interval" {
#   type        = number
#   default     = 10
#   description = "The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application"
# }

# variable "healthcheck_timeout" {
#   type        = number
#   default     = 5
#   description = "The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer"
# }

# variable "healthcheck_unhealthy_threshold_count" {
#   type        = number
#   default     = 3
#   description = "The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status"
# }

# variable "healthcheck_url" {
#   type        = string
#   default     = "/"
#   description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
# }

# variable "http_listener_enabled" {
#   type        = bool
#   default     = true
#   description = "Enable port 80 (http)"
# }

# variable "instance_refresh_enabled" {
#   type        = bool
#   default     = true
#   description = "Enable weekly instance replacement."
# }

# variable "instance_type" {
#   type        = string
#   default     = "t2.micro"
#   description = "Instances type"
# }

# variable "keypair" {
#   type        = string
#   description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
#   default     = ""
# }

# variable "loadbalancer_certificate_arn" {
#   type        = string
#   default     = ""
#   description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
# }

# variable "loadbalancer_connection_idle_timeout" {
#   type        = number
#   default     = 60
#   description = "Classic load balancer only: Number of seconds that the load balancer waits for any data to be sent or received over the connection. If no data has been sent or received after this time period elapses, the load balancer closes the connection."
# }

# variable "loadbalancer_crosszone" {
#   type        = bool
#   default     = true
#   description = "Configure the classic load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone."
# }

# variable "loadbalancer_is_shared" {
#   type        = bool
#   default     = false
#   description = "Flag to create a shared application loadbalancer. Only when loadbalancer_type = \"application\" https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-alb-shared.html"
# }

# variable "loadbalancer_managed_security_group" {
#   type        = string
#   default     = ""
#   description = "Load balancer managed security group"
# }

# variable "loadbalancer_security_groups" {
#   type        = list(string)
#   default     = []
#   description = "Load balancer security groups"
# }

# variable "loadbalancer_ssl_policy" {
#   type        = string
#   default     = ""
#   description = "Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer"
# }

# variable "loadbalancer_subnets" {
#   type        = list(string)
#   description = "List of subnets to place Elastic Load Balancer"
#   default     = []
# }

# variable "loadbalancer_type" {
#   type        = string
#   default     = "classic"
#   description = "Load Balancer type, e.g. 'application' or 'classic'"
# }

# variable "logs_delete_on_terminate" {
#   type        = bool
#   default     = false
#   description = "Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days"
# }

# variable "logs_retention_in_days" {
#   type        = number
#   default     = 7
#   description = "The number of days to keep log events before they expire."
# }

# variable "managed_actions_enabled" {
#   type        = bool
#   default     = true
#   description = "Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`"
# }

# variable "preferred_start_time" {
#   type        = string
#   default     = "Sun:10:00"
#   description = "Configure a maintenance window for managed actions in UTC"
# }

# variable "rolling_update_enabled" {
#   type        = bool
#   default     = true
#   description = "Whether to enable rolling update"
# }

# variable "rolling_update_type" {
#   type        = string
#   default     = "Health"
#   description = "`Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances"
# }

# variable "root_volume_iops" {
#   type        = number
#   default     = null
#   description = "The IOPS of the EBS root volume (only applies for gp3 and io1 types)"
# }

# variable "root_volume_size" {
#   type        = number
#   default     = 8
#   description = "The size of the EBS root volume"
# }

# variable "root_volume_throughput" {
#   type        = number
#   default     = null
#   description = "The type of the EBS root volume (only applies for gp3 type)"
# }

# variable "root_volume_type" {
#   type        = string
#   default     = "gp2"
#   description = "The type of the EBS root volume"
# }

# variable "scheduled_actions" {
#   type = list(object({
#     name            = string
#     minsize         = string
#     maxsize         = string
#     desiredcapacity = string
#     starttime       = string
#     endtime         = string
#     recurrence      = string
#     suspend         = bool
#   }))
#   default     = []
#   description = "Define a list of scheduled actions"
# }

# variable "shared_loadbalancer_arn" {
#   type        = string
#   default     = ""
#   description = "ARN of the shared application load balancer. Only when loadbalancer_type = \"application\"."
# }

# variable "spot_fleet_on_demand_above_base_percentage" {
#   type        = number
#   default     = -1
#   description = "The percentage of On-Demand Instances as part of additional capacity that your Auto Scaling group provisions beyond the SpotOnDemandBase instances. This option is relevant only when enable_spot_instances is true."
# }

# variable "spot_fleet_on_demand_base" {
#   type        = number
#   default     = 0
#   description = "The minimum number of On-Demand Instances that your Auto Scaling group provisions before considering Spot Instances as your environment scales up. This option is relevant only when enable_spot_instances is true."
# }

# variable "spot_max_price" {
#   type        = number
#   default     = -1
#   description = "The maximum price per unit hour, in US$, that you're willing to pay for a Spot Instance. This option is relevant only when enable_spot_instances is true. Valid values are between 0.001 and 20.0"
# }

# variable "ssh_listener_enabled" {
#   type        = bool
#   default     = false
#   description = "Enable SSH port"
# }

# variable "ssh_listener_port" {
#   type        = number
#   default     = 22
#   description = "SSH port"
# }

variable "tier" {
  type        = string
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, 'WebServer' or 'Worker'"
}

# variable "update_level" {
#   type        = string
#   default     = "minor"
#   description = "The highest level of update to apply with managed platform updates"
# }

# variable "updating_max_batch" {
#   type        = number
#   default     = 1
#   description = "Maximum number of instances to update at once"
# }

# variable "updating_min_in_service" {
#   type        = number
#   default     = 1
#   description = "Minimum number of instances in service during update"
# }

variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which to provision the AWS resources"
}

# variable "wait_for_ready_timeout" {
#   type        = string
#   default     = "20m"
#   description = "The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out"
# }
