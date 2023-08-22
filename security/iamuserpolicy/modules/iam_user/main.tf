resource "aws_iam_user" "iam_user" {
  name = var.iam_user_name
  tags = {
    env = var.env
    project = var.project
    foo = var.foo
    # Add more tags as needed
  }
}

resource "aws_iam_policy" "iam_policy" {
  count       = length(var.iam_policies)
  name        = var.iam_policies[count.index].name
#  name        = "my-policy-${random_integer.policy_suffix.result}"
  description = var.iam_policies[count.index].description
  policy      = var.iam_policies[count.index].policy
}

output "iam_policy_arns" {
  value = aws_iam_policy.iam_policy[*].arn
}





resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  count     = length(var.iam_policies)
  user      = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.iam_policy[count.index].arn
#   policy_arn  = module.iam.iam_policy_arns[count.index]
}


#resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
#  count       = length(var.iam_policies)
#  user        = aws_iam_user.iam_user.name
#  policy_arn  = var.iam_policies[count.index].policy_arn
#}

output "iam_user_name" {
  value = aws_iam_user.iam_user.name
}

