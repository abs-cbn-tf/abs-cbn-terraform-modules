output "arn" {
  description = "ARN of the lambda function"
  value       = [for i in aws_lambda_function.test_lambda : i.arn]
}

# output "invoke_arn" {
#   description = "ARN of the lambda function"
#   value       = [for i in aws_lambda_function.test_lambda : i.invoke_arn]
# }

output "invoke_arn" {
  description = "ARN of the lambda function"
  value       = aws_lambda_function.test_lambda.*.invoke_arn
}



output "name" {
  description = "Name of the lambda function"
  value       = [for i in aws_lambda_function.test_lambda : i.id]
}
