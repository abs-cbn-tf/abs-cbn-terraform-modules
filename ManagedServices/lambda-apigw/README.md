# API Gateway and Lambda Module

This Terraform module sets up a REST API Gateway with an integrated AWS Lambda function.

## Features

- Create and configure a REST API Gateway with an integrated AWS Lambda function.
- Configure resource, method, stage, api key, and usage plan.
- Grant necessary permissions to access other AWS resources. (e.g., AWS Lambda).

## Usage

1. Ensure you have valid AWS credentials set up for Terraform.

2. apigw.tf has the following code:

```hcl
module "apigw_lambda" {
  source        = "./modules/apigw-lambda" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan
}
```

## Input

- **source**: (Required) Path to Module
- **aws_region**: (Optional) AWS Region of the API Gateway.
- **apigw_name**: (Required) The name for the API Gateway.
- **stage_name**: (Optional) The stage name of the API Gateway stage. Default value is "dev".
- **resource_name**: The resource name set inside the API.
- **method_name**: The method name set inside the API.
- **api_key**: API Key name
- **usage_plan**: Usage Plan

## Output

- **api_gateway_invoke_url**: The invoke URL of the API Gateway.

_Note: You can change the values of the Arguments and Attributes by going to the variables.tf file and changing the default value._
