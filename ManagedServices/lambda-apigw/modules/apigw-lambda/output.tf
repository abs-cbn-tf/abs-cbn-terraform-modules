# Output the API Gateway endpoint
output "api_gateway_endpoint" {
  value = aws_api_gateway_deployment.my_deployment.invoke_url
}
