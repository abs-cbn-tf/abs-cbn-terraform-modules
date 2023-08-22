resource "aws_lb" "alb-example" {
  name               = var.alb_name
  load_balancer_type = "application"
  security_groups    = var.security_groups # Sandbox existing security groups
  subnets            = var.subnets
}
resource "aws_lb_target_group" "alb-example" {
  name             = var.target_group_name
  target_type      = "ip"
  ip_address_type  = "ipv4"
  port             = var.target_group_port
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id
}

resource "aws_lb_listener" "alb-example" {
  load_balancer_arn = aws_lb.alb-example.arn
  port              = var.listener_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-example.arn
  }
}

# resource "aws_lb_listener_certificate" "alb-example" {
#   listener_arn    = aws_lb_listener.alb-example.arn
#   certificate_arn = var.listener_cert_arn # ValidationError: A certificate cannot be specified for HTTP listeners
# }

