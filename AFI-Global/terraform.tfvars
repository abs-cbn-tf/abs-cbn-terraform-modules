aws_region = "ap-southeast-1"
profile    = "afi-global-External"

# ALB VARIABLES
alb_configurations = {
  # alb
  alb_name = "afi-web-alb"
  lb_type  = "application"
  # target group
  target_group_name             = "afi-web-tg"
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
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}

#ECS
cluster_configurations = {
  cluster_name      = "consumption-afi"
  capacity_provider = "FARGATE_SPOT"
  cluster_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}
taskdef_configurations = {
  task_family              = "afi-web-taskdef"
  task_cpu                 = 2048
  task_memory              = 4096
  task_role_name           = "afi-taskdef-role"
  network_mode             = "awsvpc"
  requires_compatibilities = "FARGATE"
  operating_system_family  = "LINUX"
  cpu_architecture         = "X86_64"

  #container
  container_name      = "afi-web-container"
  container_cpu       = 0
  container_memory    = 512
  container_port      = 3000
  container_host_port = 3000
  container_protocol  = "tcp"

  taskdef_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }

}

service_configurations = {
  service_name                       = "afi-ecs-web-service"
  desired_count                      = 1
  health_check_grace_period_seconds  = 0
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  circuit_breaker_enable             = true
  circuit_breaker_rollback           = false
  ecs_lb_port                        = 3000
  assign_public_ip                   = false
  service_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }

}
repositories = "afi-web"

# variables for vpc
project_name                 = "consumption-afi"
vpc_cidr                     = "10.195.152.0/21"
public_subnet_az1_cidr       = "10.195.152.0/24"
public_subnet_az1_abs        = "consumption-afi-subnet-public1-ap-southeast-1a"
public_subnet_az2_cidr       = "10.195.153.0/24"
public_subnet_az2_abs        = "consumption-afi-subnet-public2-ap-southeast-1b"
private_app_subnet_az1_cidr  = "10.195.154.0/24"
private_app_subnet_az1_abs   = "consumption-afi-subnet-private1-ap-southeast-1a"
private_app_subnet_az2_cidr  = "10.195.155.0/24"
private_app_subnet_az2_abs   = "consumption-afi-subnet-private2-ap-southeast-1b"
private_data_subnet_az1_cidr = "10.195.156.0/24"
private_data_subnet_az1_abs  = "consumption-afi-subnet-private3-ap-southeast-1a"
private_data_subnet_az2_cidr = "10.195.157.0/24"
private_data_subnet_az2_abs  = "consumption-afi-subnet-private4-ap-southeast-1b"
egress_cidr_blocks           = ["0.0.0.0"]
vpc_tags = {
  Name = "consumption-afi"
}

## Variables for SG
sg_configurations_1 = {
  sg_name        = "afi-web-sg"
  sg_description = "sg for afi web"
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
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}

sg_configurations_2 = {
  sg_name        = "afi-web-ecs-service-sg"
  sg_description = "sg for afi web"
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
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-afi.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}

# TAGGINGS
global_tags = {
  global_tags = "global_tag_value"
}


cloudfront_configurations_1 = {
  # random ID
  byte_length = 8
  # origin access
  origin_access_description = "afi Origin Access"
  origin_access_type        = "s3"
  origin_signing_behavior   = "always"
  origin_signing_protocol   = "sigv4"
  # distribution 
  distribution_enabled   = true
  default_root_object    = "index.html"
  allowed_methods        = ["GET", "HEAD"]
  cached_methods         = ["GET", "HEAD"]
  viewer_protocol_policy = "allow-all"
  distribution_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}


s3_configurations_1 = {
  # bucket
  bucket_name = "news-cms-store-uat"
  # block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  # s3 encryption
  sse_algorithm = "AES256"
  # bucket versioning
  bucket_versioning = "Enabled"
  #s3 object
  key                    = "index.html"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
  # taggings
  bucket_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "global"
    "abs::product"          = "afiWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "afi"
    "abs:shared"            = "No"
  }
}
