aws_region = "ap-southeast-1"
# FOR LAMBDAS WITH EVENTS TRIGGER
events_function_configurations_1 = {
  function_name = "ChangeECSFromSI2ODPricing"
  iam_role_name = "ChangeECSFromSI2ODPricing-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {

  }
  my_lambda_tags = {
    Backup             = "False"
    OwnerTeamEmail     = "mardelacruz@abs-cbn.com"
    abscbn-bus-unit    = "DCT"
    abscbn-cost-centre = 61250
    abscbn-criticality = "Silver"
    abscbn-env         = "Prod"
    abscbn-product     = "entertainment"
    abscbn-url         = "abs-cbn.com"
  }
}

eventbridge_configuration_1 = {
  #event 1
  name                 = "SpotContainerNotStartedRule"
  description          = ""
  event_bus_name       = "default"
  scheduled_expression = ""
  event_pattern        = <<PATTERN
    {
      "source": ["aws.ecs"],
      "detail-type": ["ECS Deployment State Change"],
      "detail": {
        "eventName": ["SERVICE_TASK_PLACEMENT_FAILURE"],
        "clusterArn": ["arn:aws:ecs:ap-southeast-1:807238331692:cluster/consumption"],
        "reason": ["RESOURCE:FARGATE"]
      }
    }
    PATTERN
}
events_function_configurations_2 = {
  function_name = "imp-trending-data-service"
  iam_role_name = "imp-trending-data-service-role"
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
  name                 = "imp-trending-data-load"
  description          = ""
  event_bus_name       = "default"
  scheduled_expression = "cron(5 * * * ? *)"
  event_pattern        = ""
}


#FOR LAMBDAS WITH APIGW TRIGGER
apigw_function_configurations_1 = {
  # apigw_function 1
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
}

apigw_configurations_1 = {
  # apigw 1
  apigw_name    = "content-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "content-api-key"
  usage_plan    = "content-api-plan"
}

apigw_function_configurations_2 = {
  # apigw_function 1
  function_name = "imp-page-api"
  iam_role_name = "imp-page-api-role"
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
  apigw_name    = "page-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "page-api-key"
  usage_plan    = "page-api-plan"
}

apigw_function_configurations_3 = {
  # apigw_function 1
  function_name = "imp-wb-lite-api"
  iam_role_name = "imp-wb-lite-api-role"
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
  apigw_name    = "imp-wb-lite-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "imp-wb-lite-api-key"
  usage_plan    = "imp-wb-lite-api-plan"
}

apigw_function_configurations_4 = {
  # apigw_function 1
  function_name = "imp-image-upload"
  iam_role_name = "imp-image-upload-role"
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
  apigw_name    = "imp-image-upload-API"
  resource_name = "imp-image-upload"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "imp-image-upload-API-key"
  usage_plan    = "imp-image-upload-API-plan"
}

apigw_function_configurations_5 = {
  # apigw_function 1
  function_name = "imp-image"
  iam_role_name = "imp-image-role"
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
  apigw_name    = "image"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "image-key"
  usage_plan    = "image-plan"
}

# ALB VARIABLES
listener_port     = 443
target_group_name = "push-web-alb"
target_group_port = 3000
alb_name          = "push-web-alb"

# ECS CLUSTER VARIABLES 
tf_my_cluster        = "consumption"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "push-web-taskdef"
task_cpu       = 2048
task_memory    = 4096
task_role_name = "imp-taskdef-role"
network_mode   = "awsvpc"
ecs_lb_cport   = 3000

# Container Definition Variables
container_name     = "push-web-container"
container_image    = "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/push-web:latest"
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

#cloudfront-s3
bucket_name = "cloudfront-s3-12345"
tags = {
  key1 = "value1"
  key2 = "value2"
}
