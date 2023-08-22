data "aws_iam_policy_document" "assume_role" {
  count = var.lambda_count
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
  count              = var.lambda_count
  name               = var.iam_role_name[count.index]
  assume_role_policy = data.aws_iam_policy_document.assume_role[count.index].json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  count         = var.lambda_count
  filename      = "lambda_function_payload.zip"
  function_name = var.function_name[count.index]
  role          = aws_iam_role.iam_for_lambda[count.index].arn
  handler       = var.handler
  memory_size   = var.memory

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime

  environment {
    variables = var.env_var[count.index]
  }

  tags = var.my_lambda_tags[count.index]
}

# resource "aws_lambda_permission" "lambda_permission" {
#   statement_id  = "AllowMyDemoAPIInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = "MyDemoFunction"
#   principal     = "apigateway.amazonaws.com"

#   # The /* part allows invocation from any stage, method and resource path
#   # within API Gateway.
#   # source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*"

# }

# FOR CLOUDWATCH EVENTS

# resource "aws_cloudwatch_event_rule" "every_five_minutes" {
#   name                = "every-five-minutes"
#   description         = "Fires every five minutes"
#   schedule_expression = "rate(5 minutes)"
# }

/* resource "aws_cloudwatch_event_target" "five_min_lambda" {
  rule      = aws_cloudwatch_event_rule.every_five_minutes.name
  target_id = "lambda_function"
  arn       = aws_lambda_function.test_lambda[count.index].arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name[count.index]
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_five_minutes.arn
} */

# resource "aws_cloudwatch_event_target" "five_min_lambda" {
#   count     = length(aws_lambda_function.test_lambda)
#   rule      = aws_cloudwatch_event_rule.every_five_minutes.name
#   target_id = "lambda_function_${count.index}"
#   arn       = aws_lambda_function.test_lambda[count.index].arn
# }


# resource "aws_lambda_permission" "allow_cloudwatch" {
#   count         = length(aws_lambda_function.test_lambda)
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.test_lambda[count.index].function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.every_five_minutes.arn
# }



