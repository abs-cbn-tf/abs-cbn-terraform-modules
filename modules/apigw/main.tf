# Uses the default aws account details 
data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "my_rest_api" {
  count = var.apigw_count

  name        = var.apigw_name[count.index]
  description = "My API Gateway REST API"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# Create a resource within the REST API
resource "aws_api_gateway_resource" "my_resource" {
  count       = var.apigw_count
  rest_api_id = aws_api_gateway_rest_api.my_rest_api[count.index].id
  parent_id   = aws_api_gateway_rest_api.my_rest_api[count.index].root_resource_id
  path_part   = var.resource_name[count.index]
}

# Create a method for the resource
resource "aws_api_gateway_method" "my_method" {
  count         = var.apigw_count
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api[count.index].id
  resource_id   = aws_api_gateway_resource.my_resource[count.index].id
  http_method   = var.method_name[count.index]
  authorization = "NONE"
}

# Configure the integration between API Gateway and the Lambda function
resource "aws_api_gateway_integration" "my_integration" {
  count                   = length(var.lambda_invoke_arn)
  rest_api_id             = aws_api_gateway_rest_api.my_rest_api[count.index].id
  resource_id             = aws_api_gateway_resource.my_resource[count.index].id
  http_method             = aws_api_gateway_method.my_method[count.index].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn[count.index]
}

# Deploy the API
resource "aws_api_gateway_deployment" "my_deployment" {
  count       = var.apigw_count
  rest_api_id = aws_api_gateway_rest_api.my_rest_api[count.index].id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.my_resource[count.index].id,
      aws_api_gateway_method.my_method[count.index].id,
      aws_api_gateway_integration.my_integration[count.index].id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Create stage

resource "aws_api_gateway_stage" "example" {
  count         = var.apigw_count
  deployment_id = aws_api_gateway_deployment.my_deployment[count.index].id
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api[count.index].id
  stage_name    = var.stage_name[count.index]
}

# Create the permission to invoke the Lambda function

resource "aws_lambda_permission" "lambda_permission" {
  count         = var.apigw_count
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name[count.index]
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.my_rest_api[count.index].id}/*/*/*"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  #   source_arn = "${aws_api_gateway_rest_api.my_rest_api.arn}/*"
  #   source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.my_rest_api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"

}

# apigw usage plan w/ API keys
# no method throttling yet
resource "aws_api_gateway_usage_plan" "myusageplan" {
  count = var.apigw_count
  name  = var.usage_plan[count.index]

  api_stages {
    api_id = aws_api_gateway_rest_api.my_rest_api[count.index].id
    stage  = aws_api_gateway_stage.example[count.index].stage_name
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
  count = var.apigw_count
  name  = var.api_key[count.index]
}

resource "aws_api_gateway_usage_plan_key" "main" {
  count         = var.apigw_count
  key_id        = aws_api_gateway_api_key.mykey[count.index].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.myusageplan[count.index].id
}
