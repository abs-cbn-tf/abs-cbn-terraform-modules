aws_region = "ap-southeast-1"

function_count = 2

function_configurations = [
  {
    function_name = "imp-content-api"
    iam_role_name = "imp-content-api-role"
    runtime       = "nodejs18.x"
    handler       = "index.handler"
    memory        = 128
    env_var = {
      test = "test"
    }
    my_lambda_tags = {
      App         = "Push"
      Environment = "Demo"
    }
  },
  {
    function_name = "imp-page-api"
    iam_role_name = "iimp-page-api-role"
    runtime       = "nodejs18.x"
    handler       = "index.handler"
    memory        = 128
    env_var = {
      test1 = "test1"
    }
    my_lambda_tags = {
      App         = "Push"
      Environment = "Demo"
    }
  }
]

apigw_count = 2

apigw_configurations = [
  {
    apigw_name    = "page-api"
    resource_name = "{proxy+}"
    method_name   = "ANY"
    stage_name    = "Prod"
    api_key       = "page-api-key"
    usage_plan    = "page-api-plan"
  },
  {
    apigw_name    = "content-api"
    resource_name = "{proxy+}"
    method_name   = "ANY"
    stage_name    = "Prod"
    api_key       = "content-api-key"
    usage_plan    = "content-api-plan"
  }
]

# ALB VARIABLES
listener_port     = 443
target_group_name = "push-web-alb"
target_group_port = 80
# listener_cert_arn
alb_name = "push-web-alb"

# ECS CLUSTER VARIABLES 
tf_my_cluster        = "consumption"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "push-web-taskdef"
task_cpu       = "1024"
task_memory    = "2048"
task_role_name = "imp-taskdef-role"
network_mode   = "awsvpc"
ecs_lb_cport   = 80

# Container Definition Variables
container_name     = "push-web-container"
container_image    = "nginx:latest"
container_cpu      = 256
container_memory   = 512
container_cport    = 80
container_hport    = 80
container_protocol = "tcp"
# EOF Container Definitions Variables
requires_compatibilities = "FARGATE"
operating_system         = "LINUX"
cpu_architecture         = "X86_64"

# Variables for the service
service_name      = "push-ecs-web-service"
service_role_name = "IMP-service-role"

# variables for vpc
project_name                 = "consumption"
vpc_cidr                     = "10.195.80.0/21"
public_subnet_az1_cidr       = "10.195.80.0/24"
public_subnet_az1_abs        = "consumption-subnet-public1-ap-southeast-1a"
public_subnet_az2_cidr       = "10.195.81.0/24"
public_subnet_az2_abs        = "consumption-subnet-public2-ap-southeast-1b"
private_app_subnet_az1_cidr  = "10.195.82.0/24"
private_app_subnet_az1_abs   = "consumption-subnet-private1-ap-southeast-1a"
private_app_subnet_az2_cidr  = "10.195.83.0/24"
private_app_subnet_az2_abs   = "consumption-subnet-private2-ap-southeast-1b"
private_data_subnet_az1_cidr = "10.195.84.0/24"
private_data_subnet_az1_abs  = "consumption-subnet-private3-ap-southeast-1a"
private_data_subnet_az2_cidr = "10.195.85.0/24"
private_data_subnet_az2_abs  = "consumption-subnet-private4-ap-southeast-1b"
#cidr_out_sg="0.0.0.0"
egress_cidr_blocks = ["0.0.0.0"]
#cidr_out_sg="0.0.0.0"
# egress_cidr_blocks = "0.0.0.0"
vpc_tags = {
  Name = "consumption"
}

## Variables for SG
# for ecs sg
ecs_sg_ingress_from     = 3000
ecs_sg_ingress_to       = 3000
ecs_sg_ingress_protocol = "tcp"
ecs_sg_ingress_cidr     = "0.0.0.0/0"
ecs_sg_egress_from      = 0
ecs_sg_egress_to        = 0
ecs_sg_egress_protocol  = "-1"
ecs_sg_egress_cidr      = "0.0.0.0/0"
# for regular sg
web_sg_ingress_from     = 443
web_sg_ingress_to       = 443
web_sg_ingress_protocol = "tcp"
web_sg_ingress_cidr     = "0.0.0.0/0"
web_sg_egress_from      = 0
web_sg_egress_to        = 0
web_sg_egress_protocol  = "-1"
web_sg_egress_cidr      = "0.0.0.0/0"

#cloudfront-s3
bucket_name = "cloudfront-s3-12345"
tags = {
  key1 = "value1"
  key2 = "value2"
}
