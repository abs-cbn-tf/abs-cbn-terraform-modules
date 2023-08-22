output "target_group_arn" {
  value = aws_lb_target_group.alb-example.arn
}

output "lb_dns_name" {
  value = aws_lb.alb-example.dns_name
}
