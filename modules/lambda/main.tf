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
  count              = var.function_count
  name               = var.function_configurations[count.index].iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  count = var.function_count

  filename      = "lambda_function_payload.zip"
  function_name = var.function_configurations[count.index].function_name
  role          = aws_iam_role.iam_for_lambda[count.index].arn
  handler       = var.function_configurations[count.index].handler
  memory_size   = var.function_configurations[count.index].memory

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.function_configurations[count.index].runtime

  environment {
    variables = var.function_configurations[count.index].env_var
  }

  tags = var.function_configurations[count.index].my_lambda_tags
}

