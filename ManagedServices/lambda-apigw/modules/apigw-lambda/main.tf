# module "lambda" {
#   source = "../../../lambda"
# }

# Uses the default aws account details 
data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "my_rest_api" {
  name        = var.apigw_name
  description = "My API Gateway REST API"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# Create a resource within the REST API
resource "aws_api_gateway_resource" "my_resource" {
  rest_api_id = aws_api_gateway_rest_api.my_rest_api.id
  parent_id   = aws_api_gateway_rest_api.my_rest_api.root_resource_id
  path_part   = var.resource_name
}

# Create a method for the resource
resource "aws_api_gateway_method" "my_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api.id
  resource_id   = aws_api_gateway_resource.my_resource.id
  http_method   = var.method_name
  authorization = "NONE"
}

# Configure the integration between API Gateway and the Lambda function
resource "aws_api_gateway_integration" "my_integration" {
  rest_api_id             = aws_api_gateway_rest_api.my_rest_api.id
  resource_id             = aws_api_gateway_resource.my_resource.id
  http_method             = aws_api_gateway_method.my_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

# Deploy the API
resource "aws_api_gateway_deployment" "my_deployment" {
  rest_api_id = aws_api_gateway_rest_api.my_rest_api.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.my_resource.id,
      aws_api_gateway_method.my_method.id,
      aws_api_gateway_integration.my_integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Create stage

resource "aws_api_gateway_stage" "example" {
  deployment_id = aws_api_gateway_deployment.my_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api.id
  stage_name    = var.stage_name
}

# Create the permission to invoke the Lambda function

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.my_rest_api.id}/*/*/*"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  #   source_arn = "${aws_api_gateway_rest_api.my_rest_api.arn}/*"
  #   source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.my_rest_api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"

}

# apigw usage plan w/ API keys
# no method throttling yet
resource "aws_api_gateway_usage_plan" "myusageplan" {
  name = var.usage_plan

  api_stages {
    api_id = aws_api_gateway_rest_api.my_rest_api.id
    stage  = aws_api_gateway_stage.example.stage_name
  }
  throttle_settings {
    burst_limit = 100
    rate_limit  = 50
  }
  quota_settings {
    limit  = 5000
    period = "MONTH"
  }
}

resource "aws_api_gateway_api_key" "mykey" {
  name = var.api_key
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.mykey.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.myusageplan.id
}
