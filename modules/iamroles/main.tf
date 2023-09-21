resource "aws_iam_role" "role" {
  name = var.task_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ecs.amazonaws.com",
            "ecs-tasks.amazonaws.com",

          ]
        }
      },
    ]
  })
}


resource "aws_iam_policy" "example_execution_policy" {
  name        = "example-execution-policy"
  description = "Policy for ECS task execution role"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example_execution_attachment" {
  policy_arn = aws_iam_policy.example_execution_policy.arn
  role       = aws_iam_role.role.name
}
