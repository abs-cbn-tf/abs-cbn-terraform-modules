resource "aws_lb" "alb-example" {
  name               = var.alb_name
  load_balancer_type = "application"
  security_groups    = var.ecs_security_groups
  subnets            = var.subnets
  tags               = var.tags
}
resource "aws_lb_target_group" "alb-example" {
  name             = var.target_group_name
  target_type      = "ip"
  ip_address_type  = "ipv4"
  port             = var.target_group_port
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/healthCheck"
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 15
    interval            = 20
  }
}

data "aws_acm_certificate" "existing" {

  domain = "*.abs-cbn.com"

  most_recent = true



  statuses = ["ISSUED"]

}


resource "aws_lb_listener" "alb-example" {
  load_balancer_arn = aws_lb.alb-example.arn
  port              = var.listener_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-example.arn
  }
  certificate_arn = data.aws_acm_certificate.existing.arn
}

