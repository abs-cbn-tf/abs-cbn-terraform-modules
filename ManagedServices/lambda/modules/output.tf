# Output variable definitions

output "arn" {
  description = "ARN of the lambda function"
  value       = aws_lambda_function.test_lambda.arn
}

output "invoke_arn" {
  description = "ARN of the lambda function"
  value       = aws_lambda_function.test_lambda.invoke_arn
}


output "name" {
  description = "Name of the lambda function"
  value       = aws_lambda_function.test_lambda.id
}
