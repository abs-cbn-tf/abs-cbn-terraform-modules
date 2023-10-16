aws_region = "ap-southeast-1"
profile    = "News-UAT-External"
# FOR LAMBDAS WITH EVENTS TRIGGER
events_function_configurations_2 = {
  function_name = "news-imp-trending-data-service"
  iam_role_name = "news-imp-trending-data-service-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    API_PWD       = ""
    API_USER      = ""
    ENV_KEY       = ""
    MONGO_DB_NAME = ""
    MONGO_URI     = ""
    TRENDING_API  = ""
  }
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

eventbridge_configuration_2 = {
  #   #event 2
  name                 = "news-imp-trending-data-load"
  description          = ""
  event_bus_name       = "default"
  scheduled_expression = "cron(5 * * * ? *)"
  event_pattern        = ""
  event_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

# LAMBDA APIGW
apigw_function_configurations_1 = {
  # apigw_function 1
  function_name = "news-imp-content-api"
  iam_role_name = "news-imp-content-api-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    DB_MAX_POOL_SIZE          = ""
    DB_SOCKET_TIMEOUT         = ""
    IMP_IMAGE_API             = ""
    IMP_IMAGE_API_ENT         = ""
    IMP_IMAGE_API_PUSH        = ""
    IVS_KEY                   = ""
    MONGODB_ENT               = ""
    MONGODB_PUSH              = ""
    MONGODB_URL               = ""
    MONGODB_URL_ENT           = ""
    MONGODB_URL_PUSH          = ""
    MONGO_GRAPHQL_API_KEY     = ""
    MONGO_GRAPHQL_API_KEY_ENT = ""
    MONGO_GRAPHQL_URL         = ""
    MONGO_GRAPHQL_URL_ENT     = ""
    NODE_ENV                  = ""
    PUBLISH_DATE              = ""
    SP_ID                     = ""
    WEB_ENT_URL               = ""
    WEB_PUSH_URL              = ""
    WEB_URL                   = ""
    WIDGET_ID                 = ""
  }
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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
  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

apigw_function_configurations_2 = {
  # apigw_function 1
  function_name = "news-imp-page-api"
  iam_role_name = "news-imp-page-api-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    DB_MAX_POOL_SIZE  = ""
    DB_SOCKET_TIMEOUT = ""
    MONGODB_URL       = ""
    NODE_ENV          = ""
  }
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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
  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

# ALB VARIABLES
alb_configurations = {
  # alb
  alb_name = "news-web-alb"
  lb_type  = "application"
  # target group
  target_group_name             = "news-web-tg"
  target_type                   = "ip"
  ip_address_type               = "ipv4"
  target_group_port             = 3000
  target_group_protocol         = "HTTP"
  target_group_protocol_version = "HTTP1"
  target_group_health_check = {
    enabled             = "true"
    protocol            = "HTTP"
    path                = "/healthCheck"
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 15
    interval            = 20
  }
  # listener
  listener_port       = 443
  listener_protocol   = "HTTPS"
  listener_ssl_policy = "ELBSecurityPolicy-TLS-1-2-2017-01"
  listener_default_action = {
    type = "forward"
  }
  alb_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}


# ECS CLUSTER VARIABLES 
tf_my_cluster        = "consumption-news"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "news-web-taskdef"
task_cpu       = 2048
task_memory    = 4096
task_role_name = "news-taskdef-role"
network_mode   = "awsvpc"
ecs_lb_cport   = 3000

# Container Definition Variables
container_name     = "news-web-container"
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
service_role_name = "IMP-News-service-role"
repositories      = "news-web"

# variables for vpc
project_name                 = "consumption-news"
vpc_cidr                     = "10.195.152.0/21"
public_subnet_az1_cidr       = "10.195.152.0/24"
public_subnet_az1_abs        = "consumption-news-subnet-public1-ap-southeast-1a"
public_subnet_az2_cidr       = "10.195.153.0/24"
public_subnet_az2_abs        = "consumption-news-subnet-public2-ap-southeast-1b"
private_app_subnet_az1_cidr  = "10.195.154.0/24"
private_app_subnet_az1_abs   = "consumption-news-subnet-private1-ap-southeast-1a"
private_app_subnet_az2_cidr  = "10.195.155.0/24"
private_app_subnet_az2_abs   = "consumption-news-subnet-private2-ap-southeast-1b"
private_data_subnet_az1_cidr = "10.195.156.0/24"
private_data_subnet_az1_abs  = "consumption-news-subnet-private3-ap-southeast-1a"
private_data_subnet_az2_cidr = "10.195.157.0/24"
private_data_subnet_az2_abs  = "consumption-news-subnet-private4-ap-southeast-1b"
egress_cidr_blocks           = ["0.0.0.0"]
vpc_tags = {
  Name = "consumption-news"
}

## Variables for SG
sg_configurations_1 = {
  sg_name        = "news-web-sg"
  sg_description = "sg for news web"
  ingress_rules = [
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
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self        = true
    }
  ]
  sg_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

sg_configurations_2 = {
  sg_name        = "news-web-ecs-service-sg"
  sg_description = "sg for news web"
  ingress_rules = [
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = true
    }
  ]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self        = true
    }
  ]
  sg_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

# TAGGINGS
global_tags = {
  global_tags = "global_tag_value"
}

# individual_tags = {
#   eventbridge-lambda-2 = {
#     #news-imp-trending-data-service
#     k1 = "v1"
#     k2 = "v2"
#   }
#   apigw-lambda-1 = {
#     #news-imp-content-api
#     k1 = "v1"
#     k2 = "v2"
#   }
#   apigw-lambda-2 = {
#     #news-imp-page-api
#     k1 = "v1"
#     k2 = "v2"
#   }
#   function_1 = {
#     #news-imp-syndicate-service
#     k1 = "v1"
#     k2 = "v2"
#   }
#   vpc = {
#     k1 = "vpc"
#     k2 = "VPC"
#   }
#   ecs_alb = {
#     k1 = "v1"
#     k2 = "v2"
#   }
#   news-web-ecs-service-sg = {
#     k1 = "v1"
#     k2 = "v2"
#   }
#   news-web-sg = {
#     k1 = "v1"
#     k2 = "v2"
#   }
# }


