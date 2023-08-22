# Output the API Gateway endpoint
output "api_gateway_endpoint" {
  value = [for i in aws_api_gateway_deployment.my_deployment : i.invoke_url]
}
