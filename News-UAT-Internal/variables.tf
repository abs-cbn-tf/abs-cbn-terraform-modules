variable "aws_region" {}
variable "profile" {}

# FOR LAMBDAS WITH EVENTS TRIGGER

variable "events_function_configurations_2" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}
variable "eventbridge_configuration_2" {
  description = "List of cloudwatch events configurations"
  type = object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
    event_pattern        = string
  })
}

# FOR LAMBDAS WITH APIGW TRIGGER
variable "apigw_function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "apigw_configurations_1" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "apigw_function_configurations_2" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "apigw_configurations_2" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "apigw_function_configurations_3" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "apigw_configurations_3" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "apigw_function_configurations_4" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "apigw_configurations_4" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "apigw_function_configurations_5" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "apigw_configurations_5" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
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
# variable "container_image" {}
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

variable "ingress_rules_1" {}
variable "ingress_rules_2" {}
variable "egress_rules_1" {}
variable "egress_rules_2" {}


variable "cluster_name" {}
variable "instance_type" {}
variable "aws_account_id" {}


variable "global_tags" {
  description = "Global tags for all resources"
  type        = map(string)
  default = {
    g1 = "v1"
    k2 = "v2"
  }
}

variable "individual_tags" {
  description = "Individual tags for specific modules"
  type        = map(map(string))
  default = {
    ecs-alb = {
      k1 = "v1"
      k2 = "v2"
    }
    function_1 = {
      k1 = "v1"
      k2 = "v2"
    }
    eventbridge-lambda-2 = {
      k1 = "v1"
      k2 = "v3"
    }
    apigw-lambda-1 = {
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-2 = {
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-3 = {
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-4 = {
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-5 = {
      k1 = "v1"
      k2 = "v2"
    }
    opensearch_dev = {
      k1 = "v1"
      k2 = "v2"
    }
    opensearch_prod = {
      k1 = "v1"
      k2 = "v2"
    }
    cloudfront_s3 = {
      k1 = "v1"
      k2 = "v2"
    }
    push-web-ecs-service-sg = {
      k1 = "v1"
      k2 = "v2"
    }
    push-web-sg = {
      k1 = "v1"
      k2 = "v2"
    }
    // Add more individual tags for other modules as needed
  }
}

variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = string
  #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
  default = "push-web"
}
