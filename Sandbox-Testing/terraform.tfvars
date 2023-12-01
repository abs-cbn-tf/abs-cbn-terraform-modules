aws_region = "ap-southeast-1"
profile    = "default"

function_configurations_1 = {
  function_name = "imp-content-api"
  iam_role_name = "kentico-news-service-lambda-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
  }
  lambda_tags = {
  }
}
