variable "aws_region" {}

# for lambda events
variable "events_function_count" {
  type    = number
  default = 1
}

variable "events_function_configurations" {
  description = "Map of Lambda function configurations"
  type = list(object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  }))
}

variable "eventbridge_count" {
  type = number
}

variable "eventbridge_configuration" {
  description = "List of cloudwatch events configurations"
  type = list(object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
  }))
}

# for apigw lambda 
variable "apigw_function_count" {
  type    = number
  default = 1
}

variable "apigw_function_configurations" {
  description = "Map of Lambda function configurations"
  type = list(object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  }))
}

variable "apigw_count" {
  type    = number
  default = 1
}

variable "apigw_configurations" {
  description = "Map of APIGW configurations"
  type = list(object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  }))
}

# ALB VARIABLES
/*
variable "vpc_id" {
  default = module.vpc.vpc_id
}
variable "subnets" {
  default = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
}
*/
//variable "security_groups" {}
variable "listener_port" {}
variable "target_group_name" {}
variable "target_group_port" {}
# variable "listener_cert_arn" {}
variable "alb_name" {}

# ECS CLUSTER VARIABLES 
variable "tf_my_cluster" {}
variable "tf_capacity_provider" {}

#ECS SERVICE VARIABLES
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "task_role_name" {}
variable "network_mode" {}
variable "ecs_lb_cport" {}

# Container Definition Variables
variable "container_name" {}
variable "container_image" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "container_cport" {}
variable "container_hport" {}
variable "container_protocol" {}
variable "requires_compatibilities" {}
variable "operating_system" {}
variable "cpu_architecture" {}

# Variables for the service
variable "service_name" {}

variable "service_role_name" {}

# variables for vpc
variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

variable "public_subnet_az1_abs" {}
variable "public_subnet_az2_abs" {}
variable "private_app_subnet_az1_abs" {}
variable "private_app_subnet_az2_abs" {}
variable "private_data_subnet_az1_abs" {}
variable "private_data_subnet_az2_abs" {}

variable "egress_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "vpc_tags" {}

## Variables for SG
# for ecs sg
variable "ecs_sg_ingress_from" {}
variable "ecs_sg_ingress_to" {}
variable "ecs_sg_ingress_protocol" {}
variable "ecs_sg_ingress_cidr" {}
variable "ecs_sg_egress_from" {}
variable "ecs_sg_egress_to" {}
variable "ecs_sg_egress_protocol" {}
variable "ecs_sg_egress_cidr" {}
# for regular sg
variable "web_sg_ingress_from" {}
variable "web_sg_ingress_to" {}
variable "web_sg_ingress_protocol" {}
variable "web_sg_ingress_cidr" {}
variable "web_sg_egress_from" {}
variable "web_sg_egress_to" {}
variable "web_sg_egress_protocol" {}
variable "web_sg_egress_cidr" {}

# cloudfront-s3
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "The tags to assign to the S3 bucket"
  type        = map(string)
}

