# AWS Lambda Module

This Terraform module sets up an AWS Lambda function with the necessary resources and configurations. It provides an easy way to deploy and manage your serverless code on AWS Lambda.

## Features

- Create and configure an AWS Lambda function.
- Customize the Lambda function code and runtime environment.
- Configure environment variables, memory allocation, and timeout settings.
- Grant necessary permissions to access other AWS resources. (e.g., API Gateway).

## Usage

1. Ensure you have valid AWS credentials set up for Terraform.

2. lambda.tf has the following code:

```hcl
module "lambda_function" {
  source        = "./modules" # Mandatory
  aws_region    = var.aws_region
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  iam_role_name = var.iam_role_name
  memory        = var.memory
  value1        = var.value1
  value2        = var.value2
  value3        = var.value3
  tags          = var.my_lambda_tags
}

```

## Input

- **source**: (Required) Path to Module
- **aws_region**: (Optional) AWS Region of the Lambda Function.
- **function_name**: (Required) The name for Lambda Function.
- **runtime**: The Runtime set inside the Lambda Function.
- **handler**: The Handler type set inside the Lambda Function.
- **iam_role_name**: The IAM Role Name set inside the Lambda Function.
- **memory**: Memory for the Lambda Function.
- **values**: Environment Variables values for the Lambda Function.
- **tags**: Tags for the Lambda Function.

## Output

- **lambda_arn**: The ARN of the Lambda Function.
- **invoke_url**: The Invoke URL of the Lambda Function.
- **lambda_name**: The Name of the Lambda Function.

_Note: You can change the values of the Arguments and Attributes by going to the variables.tf file and changing the default value._
