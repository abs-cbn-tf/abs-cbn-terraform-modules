resource "aws_lb" "alb-example" {
  name               = var.alb_configurations.alb_name
  load_balancer_type = var.alb_configurations.lb_type
  security_groups    = var.ecs_security_groups
  subnets            = var.subnets
  tags               = merge(var.tags, var.alb_configurations.alb_tags)
}
resource "aws_lb_target_group" "alb-example" {
  name             = var.alb_configurations.target_group_name
  target_type      = var.alb_configurations.target_type
  ip_address_type  = var.alb_configurations.ip_address_type
  port             = var.alb_configurations.target_group_port
  protocol         = var.alb_configurations.target_group_protocol
  protocol_version = var.alb_configurations.target_group_protocol_version
  vpc_id           = var.vpc_id

  health_check {
    enabled             = var.alb_configurations.target_group_health_check["enabled"]
    protocol            = var.alb_configurations.target_group_health_check["protocol"]
    path                = var.alb_configurations.target_group_health_check["path"]
    healthy_threshold   = var.alb_configurations.target_group_health_check["healthy_threshold"]
    unhealthy_threshold = var.alb_configurations.target_group_health_check["unhealthy_threshold"]
    timeout             = var.alb_configurations.target_group_health_check["timeout"]
    interval            = var.alb_configurations.target_group_health_check["interval"]
  }
  tags = merge(var.tags, var.alb_configurations.alb_tags)
}

data "aws_acm_certificate" "existing" {
  domain      = "*.abs-cbn.com"
  most_recent = true
  statuses    = ["ISSUED"]
  tags        = merge(var.tags, var.alb_configurations.alb_tags)
}


resource "aws_lb_listener" "alb-example" {
  load_balancer_arn = aws_lb.alb-example.arn
  port              = var.alb_configurations.listener_port
  protocol          = var.alb_configurations.listener_protocol
  ssl_policy        = var.alb_configurations.listener_ssl_policy
  default_action {
    type             = var.alb_configurations.listener_default_action["type"]
    target_group_arn = aws_lb_target_group.alb-example.arn
  }
  certificate_arn = data.aws_acm_certificate.existing.arn
  tags            = merge(var.tags, var.alb_configurations.alb_tags)
}

