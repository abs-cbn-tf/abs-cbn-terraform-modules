output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.role.arn
}

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.role.name
}
