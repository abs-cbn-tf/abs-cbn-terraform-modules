# Output the API Gateway endpoint
output "apigw_lambda_gateway_endpoint" {
  value = module.apigw_lambda.api_gateway_endpoint
}

# output "apigw_gateway_endpoint" {
#   value = module.apigw.api_gateway_endpoint
# }

