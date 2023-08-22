module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  subnets           = var.subnets
  security_groups   = var.security_groups
  listener_port     = var.listener_port
  target_group_name = var.target_group_name
  target_group_port = var.target_group_port
  vpc_id            = var.vpc_id
  # listener_cert_arn = var.listener_cert_arn
  #   listener_rules = [
  #     {
  #       priority = 1
  #       condition = {
  #         host_header = "abs-cbn.com"
  #       }
  #       action = {
  #         target_group_arn = module.alb.target_group_arn
  #         type             = "forward"
  #       }
  #     },
  #     {
  #       priority = 2
  #       condition = {
  #         host_header = "abs-new.com"
  #       }
  #       action = {
  #         target_group_arn = module.alb.target_group_arn
  #         type             = "forward"
  #       }
  #     }
  #   ]
  #   listener_cert_arn = var.listener_cert_arn
}

