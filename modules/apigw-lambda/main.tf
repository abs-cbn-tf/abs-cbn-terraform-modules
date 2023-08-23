# #--------- LAMBDA FUNCTION ----------#

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "iam_for_lambda" {
#   for_each           = var.apigw_lambda_configuration
#   name               = each.value.iam_role_name
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# data "archive_file" "lambda" {
#   type        = "zip"
#   source_file = "index.js"
#   output_path = "lambda_function_payload.zip"
# }

# resource "aws_lambda_function" "test_lambda" {
#   for_each      = var.apigw_lambda_configuration
#   filename      = "lambda_function_payload.zip"
#   function_name = each.value.function_name
#   role          = aws_iam_role.iam_for_lambda[each.key].arn
#   handler       = each.value.handler
#   memory_size   = each.value.memory

#   source_code_hash = data.archive_file.lambda.output_base64sha256

#   runtime = each.value.runtime

#   environment {
#     variables = each.value.env_var
#   }

#   tags = each.value.my_lambda_tags
# }

# #--------- API GATEWAY ----------#

# # Uses the default aws account details 
# data "aws_caller_identity" "current" {}

# resource "aws_api_gateway_rest_api" "my_rest_api" {
#   for_each = var.apigw_lambda_configuration

#   name        = each.value.apigw_name
#   description = "My API Gateway REST API"
#   endpoint_configuration {
#     types = ["REGIONAL"]
#   }
# }

# # Create a resource within the REST API
# resource "aws_api_gateway_resource" "my_resource" {
#   for_each = var.apigw_lambda_configuration

#   rest_api_id = aws_api_gateway_rest_api.my_rest_api[each.key].id
#   parent_id   = aws_api_gateway_rest_api.my_rest_api[each.key].root_resource_id
#   path_part   = each.value.resource_name
# }

# # Create a method for the resource
# resource "aws_api_gateway_method" "my_method" {
#   for_each = var.apigw_lambda_configuration

#   rest_api_id   = aws_api_gateway_rest_api.my_rest_api[each.key].id
#   resource_id   = aws_api_gateway_resource.my_resource[each.key].id
#   http_method   = each.value.method_name
#   authorization = "NONE"
# }

# # Configure the integration between API Gateway and the Lambda function
# resource "aws_api_gateway_integration" "my_integration" {
#   for_each = var.apigw_lambda_configuration

#   rest_api_id             = aws_api_gateway_rest_api.my_rest_api[each.key].id
#   resource_id             = aws_api_gateway_resource.my_resource[each.key].id
#   http_method             = aws_api_gateway_method.my_method[each.key].http_method
#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.test_lambda[each.key].invoke_arn
# }

# # Deploy the API
# resource "aws_api_gateway_deployment" "my_deployment" {
#   for_each = var.apigw_lambda_configuration

#   rest_api_id = aws_api_gateway_rest_api.my_rest_api[each.key].id

#   triggers = {
#     # NOTE: The configuration below will satisfy ordering considerations,
#     #       but not pick up all future REST API changes. More advanced patterns
#     #       are possible, such as using the filesha1() function against the
#     #       Terraform configuration file(s) or removing the .id references to
#     #       calculate a hash against whole resources. Be aware that using whole
#     #       resources will show a difference after the initial implementation.
#     #       It will stabilize to only change when resources change afterwards.
#     redeployment = sha1(jsonencode([
#       aws_api_gateway_resource.my_resource[each.key].id,
#       aws_api_gateway_method.my_method[each.key].id,
#       aws_api_gateway_integration.my_integration[each.key].id,
#     ]))
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Create stage

# resource "aws_api_gateway_stage" "example" {
#   for_each = var.apigw_lambda_configuration

#   deployment_id = aws_api_gateway_deployment.my_deployment[each.key].id
#   rest_api_id   = aws_api_gateway_rest_api.my_rest_api[each.key].id
#   stage_name    = each.value.stage_name
# }

# # Create the permission to invoke the Lambda function

# resource "aws_lambda_permission" "lambda_permission" {
#   for_each = var.apigw_lambda_configuration

#   statement_id  = "AllowMyDemoAPIInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.test_lambda[each.key].id
#   principal     = "apigateway.amazonaws.com"
#   source_arn    = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.my_rest_api[each.key].id}/*/*/*"

#   # The /* part allows invocation from any stage, method and resource path
#   # within API Gateway.
#   #   source_arn = "${aws_api_gateway_rest_api.my_rest_api.arn}/*"
#   #   source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.my_rest_api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
# }

# # apigw usage plan w/ API keys
# # no method throttling yet
# resource "aws_api_gateway_usage_plan" "myusageplan" {
#   for_each = var.apigw_lambda_configuration
#   name     = each.value.usage_plan

#   api_stages {
#     api_id = aws_api_gateway_rest_api.my_rest_api[each.key].id
#     stage  = aws_api_gateway_stage.example[each.key].stage_name
#   }
#   throttle_settings {
#     burst_limit = 100
#     rate_limit  = 50
#   }
#   quota_settings {
#     limit  = 5000
#     period = "MONTH"
#   }
# }

# resource "aws_api_gateway_api_key" "mykey" {
#   for_each = var.apigw_lambda_configuration
#   name     = each.value.api_key
# }

# resource "aws_api_gateway_usage_plan_key" "main" {
#   for_each = var.apigw_lambda_configuration

#   key_id        = aws_api_gateway_api_key.mykey[each.key].id
#   key_type      = "API_KEY"
#   usage_plan_id = aws_api_gateway_usage_plan.myusageplan[each.key].id
# }

module "lambda_function" {
  source     = "../lambda" # Mandatory
  aws_region = var.aws_region

  function_count          = var.function_count
  function_configurations = var.function_configurations
}

module "apigw" {
  source     = "../apigw"
  aws_region = var.aws_region

  apigw_count          = var.apigw_count
  apigw_configurations = var.apigw_configurations

  apigw_lambda_invoke_arn = module.lambda_function.invoke_arn
  apigw_function_name     = module.lambda_function.name
}
