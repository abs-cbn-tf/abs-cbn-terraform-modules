variable "alb_configurations" {
  type = object({
    # alb
    alb_name = string #news-web-alb
    lb_type  = string #application
    # target group
    target_group_name             = string #news-web-tg
    target_type                   = string #ip
    ip_address_type               = string #ipv4
    target_group_port             = number #3000
    target_group_protocol         = string #HTTP
    target_group_protocol_version = string #HTTP1
    target_group_health_check     = map(string)
    # listener
    listener_port           = number #443
    listener_protocol       = string #HTTPS
    listener_ssl_policy     = string #ELBSecurityPolicy-TLS-1-2-2017-01
    listener_default_action = map(string)
    alb_tags                = map(string)
  })
}
variable "subnets" {
  description = "List of subnets where the ALB will be deployed"
  type        = list(string)
}

variable "ecs_security_groups" {
  description = "List of security groups associated with the ALB"
  type        = list(string)
}
variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
