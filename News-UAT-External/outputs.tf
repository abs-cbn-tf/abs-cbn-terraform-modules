#apigw invoke url
# output "api_gateway_endpoint" {
#   value = module.apigw-lambda.api_gateway_endpoint
# }

#cloudfront domain name
# output "distribution_domain_name" {
#   value = module.cloudfront-s3.distribution_domain_name
# }
#alb url
output "lb_dns_name" {
  value = module.ecs-alb.lb_dns_name
}
#VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_az1_id" {
  value = module.vpc.public_subnet_az1_id
}


output "public_subnet_az2_id" {
  value = module.vpc.public_subnet_az2_id
}

