aws_region = "ap-southeast-1"
profile    = "default"
# FOR LAMBDAS WITH EVENTS TRIGGER
events_function_configurations_2 = {
  function_name = "news-imp-trending-data-service"
  iam_role_name = "news-imp-trending-data-service-role"
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
}

eventbridge_configuration_2 = {
  #   #event 2
  name                 = "news-imp-trending-data-load"
  description          = ""
  event_bus_name       = "default"
  scheduled_expression = "cron(5 * * * ? *)"
  event_pattern        = ""
}


#FOR LAMBDAS WITH APIGW TRIGGER
apigw_function_configurations_1 = {
  # apigw_function 1
  function_name = "news-imp-content-api"
  iam_role_name = "news-imp-content-api-role"
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
}

apigw_configurations_1 = {
  # apigw 1
  apigw_name    = "news-content-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-content-api-key"
  usage_plan    = "news-content-api-plan"
}

apigw_function_configurations_2 = {
  # apigw_function 1
  function_name = "news-imp-page-api"
  iam_role_name = "news-imp-page-api-role"
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
}

apigw_configurations_2 = {
  # apigw 1
  apigw_name    = "news-page-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-page-api-key"
  usage_plan    = "news-page-api-plan"
}

apigw_function_configurations_3 = {
  # apigw_function 1
  function_name = "news-imp-wb-lite-api"
  iam_role_name = "news-imp-wb-lite-api-role"
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
}

apigw_configurations_3 = {
  # apigw 1
  apigw_name    = "news-imp-wb-lite-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-imp-wb-lite-api-key"
  usage_plan    = "news-imp-wb-lite-api-plan"
}

apigw_function_configurations_4 = {
  # apigw_function 1
  function_name = "news-imp-image-upload"
  iam_role_name = "news-imp-image-upload-role"
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
}

apigw_configurations_4 = {
  # apigw 1
  apigw_name    = "news-imp-image-upload-API"
  resource_name = "news-imp-image-upload"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-imp-image-upload-API-key"
  usage_plan    = "news-imp-image-upload-API-plan"
}

apigw_function_configurations_5 = {
  # apigw_function 1
  function_name = "news-imp-image"
  iam_role_name = "news-imp-image-role"
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
}

apigw_configurations_5 = {
  # apigw 1
  apigw_name    = "news-image"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-image-key"
  usage_plan    = "news-image-plan"
}

function_configurations_1 = {
  function_name = "news-imp-syndicate-service"
  iam_role_name = "news-imp-syndicate-service-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    ACCESS_TOKEN  = ""
    BASE_URL      = ""
    BRAND         = ""
    CLIENT_SECRET = ""
    CLIENT_TOKEN  = ""
    HOST          = ""
    WEB_URL       = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "Prod"
  }
}

# ALB VARIABLES
listener_port     = 443
target_group_name = "push-web-alb"
target_group_port = 3000
alb_name          = "push-web-alb"

# ECS CLUSTER VARIABLES 
tf_my_cluster        = "news-consumption"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "news-web-taskdef"
task_cpu       = 2048
task_memory    = 4096
task_role_name = "news-imp-taskdef-role"
network_mode   = "awsvpc"
ecs_lb_cport   = 3000

# Container Definition Variables
container_name     = "news-web-container"
container_image    = "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/news-web:latest"
container_cpu      = 0
container_memory   = 512
container_cport    = 3000
container_hport    = 3000
container_protocol = "tcp"
# EOF Container Definitions Variables
requires_compatibilities = "FARGATE"
operating_system         = "LINUX"
cpu_architecture         = "X86_64"

# Variables for the service
service_name      = "news-ecs-web-service"
service_role_name = "IMP-service-role"

# variables for vpc
project_name                 = "news-consumption"
vpc_cidr                     = "10.195.80.0/21"
public_subnet_az1_cidr       = "10.195.80.0/24"
public_subnet_az1_abs        = "news-consumption-subnet-public1-ap-southeast-1a"
public_subnet_az2_cidr       = "10.195.81.0/24"
public_subnet_az2_abs        = "news-consumption-subnet-public2-ap-southeast-1b"
private_app_subnet_az1_cidr  = "10.195.82.0/24"
private_app_subnet_az1_abs   = "news-consumption-subnet-private1-ap-southeast-1a"
private_app_subnet_az2_cidr  = "10.195.83.0/24"
private_app_subnet_az2_abs   = "news-consumption-subnet-private2-ap-southeast-1b"
private_data_subnet_az1_cidr = "10.195.84.0/24"
private_data_subnet_az1_abs  = "news-consumption-subnet-private3-ap-southeast-1a"
private_data_subnet_az2_cidr = "10.195.85.0/24"
private_data_subnet_az2_abs  = "news-consumption-subnet-private4-ap-southeast-1b"
#cidr_out_sg="0.0.0.0"
egress_cidr_blocks = ["0.0.0.0"]
#cidr_out_sg="0.0.0.0"
# egress_cidr_blocks = "0.0.0.0"
vpc_tags = {
  Name = "news-consumption"
}

## Variables for SG
ingress_rules_1 = [{
  from_port   = 3000
  to_port     = 3000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  self        = true
}]
egress_rules_1 = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  self        = true
}]
ingress_rules_2 = [
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  },
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
]
egress_rules_2 = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  self        = true
}]


