data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.function_configurations.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = var.function_configurations.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.function_configurations.handler
  memory_size   = var.function_configurations.memory

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.function_configurations.runtime

  environment {
    variables = var.function_configurations.env_var
  }

#  tags = var.function_configurations.my_lambda_tags
  tags = var.tags
}

