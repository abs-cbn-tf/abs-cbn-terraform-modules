aws_region = "ap-southeast-1"

# INDIVIDUAL LAMBDA FUNCTIONS FOR PUSH
lambda_function_count = 5
lambda_function_name = [
  "ChangeEC2FromSI2ODPricing",
  "imp-trending-data-service",
  "imp-syndicate-service",
  "newrelic-log-ingestion",
  "kentico-push-service-lambda"
]
lambda_runtime = "nodejs18.x"
lambda_handler = "index.handler"
lambda_memory  = 128
lambda_iam_role_name = [
  "ChangeEC2FromSI2ODPricing-role",
  "imp-trending-data-service-role",
  "imp-syndicate-service-role",
  "newrelic-log-ingestion-role",
  "kentico-push-service-lambda-role"
]
lambda_env_var = [
  {
  },
  {
  },
  {
  },
  {
  },
  {
  }
]
lambda_function_tags = [
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  }

]

# LAMBDA FUNCTIONS WITH APIGW TRIGGER
apigw_count = 6
apigw_name = [
  "content-api-gateway",
  "page-api-gateway",
  "image",
  "imp-image-upload-API",
  "imp-wb-lite-api",
  "pb-api-gateway"
]
resource_name = [
  "{proxy+}",
  "{proxy+}",
  "{proxy+}",
  "imp-image-upload",
  "{proxy+}",
  "{proxy+}",

]
method_name = ["ANY", "ANY", "ANY", "ANY", "ANY", "ANY"]
stage_name  = ["PROD", "PROD", "PROD", "PROD", "PROD", "PROD"]
api_key = [
  "push-web-call-content-api",
  "push-web-call-page-api",
  "ui-call-image-fetch",
  "wb-call-image-upload",
  "wb-lite-api",
  "pb-web-call-pb-api"
]
usage_plan = [
  "push-web-call-content-api-plan",
  "push-web-call-page-api-plan",
  "ui-call-image-fetch-plan",
  "wb-call-image-upload-plan",
  "wb-lite-api-plan",
  "pb-web-call-pb-api"
]

lambda_count = 6
function_name = [
  "imp-content-api",
  "imp-page-api",
  "imp-image",
  "imp-image-upload",
  "imp-wb-lite-api",
  "imp-pcm-api"
]
runtime = "nodejs18.x"
handler = "index.handler"
iam_role_name = [
  "imp-content-api-role",
  "imp-page-api-role",
  "imp-image-role",
  "imp-image-upload-role",
  "imp-wb-lite-api-role",
  "imp-pcm-api-role"
]
memory = 128
env_var = [
  {
  },
  {
  },
  {
  },
  {
  },
  {
  },
  {
  }
]
my_lambda_tags = [
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
  },
  {
    Application = "Push"
    Environment = "Demo"
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
