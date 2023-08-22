variable "aws_region" {}
# variables for apigw
variable "apigw_count" {}
variable "apigw_name" {
  type = list(string)
}
variable "resource_name" {
  type = list(string)
}

variable "method_name" {
  type = list(string)
}
variable "stage_name" {
  type = list(string)
}
variable "api_key" {
  type = list(string)
}
variable "usage_plan" {
  type = list(string)
}

# variables for lambda
variable "lambda_count" {}
variable "function_name" {
  type = list(string)
}
variable "runtime" {}
variable "handler" {}
variable "iam_role_name" {
  type = list(string)
}
variable "memory" {}

# environment variables for lambda
variable "env_var" {
  type = list(map(string))
}
variable "my_lambda_tags" {
  type = list(map(string))
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

#variables for individual lambdas
variable "lambda_function_count" {}
variable "lambda_function_name" {
  type = list(string)
}
variable "lambda_runtime" {}
variable "lambda_handler" {}
variable "lambda_iam_role_name" {
  type = list(string)
}
variable "lambda_memory" {}

# environment variables for lambda
variable "lambda_env_var" {
  type = list(map(string))
}
variable "lambda_function_tags" {
  type = list(map(string))
}
