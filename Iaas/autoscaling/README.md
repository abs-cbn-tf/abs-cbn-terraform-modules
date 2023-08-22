# Autoscaling Module

This Terraform module creates an autoscaling group with launch template, tags, and scaling policies.

## Usage

```hcl
module "autoscaling" {
  source             = "./modules/autoscaling"
  vpc_id             = "vpc-12345678"
  availability_zones = ["us-east-1a", "us-west-1b"]
  ami_id             = "ami-12345678"
  instance_type      = "t2.micro"
  min_size           = 1
  max_size           = 3
  desired_capacity   = 2
  scale_out_cpu_threshold = 70
  scale_in_cpu_threshold  = 30
}


## Inputs

The following input variables are supported:

### `vpc_id`

- Description: ID of the VPC
- Type: `string`
- Default: *None*

### `availability_zones`

- Description: List of availability zones
- Type: `list(string)`
- Default: `[]`

### `ami_id`

- Description: ID of the AMI
- Type: `string`
- Default: *None*

### `instance_type`

- Description: Type of the instance
- Type: `string`
- Default: *None*

### `min_size`

- Description: Minimum number of instances
- Type: `number`
- Default: *None*

### `max_size`

- Description: Maximum number of instances
- Type: `number`
- Default: *None*

### `desired_capacity`

- Description: Desired number of instances
- Type: `number`
- Default: *None*

### `scale_out_cpu_threshold`

- Description: CPU threshold for scale-out
- Type: `number`
- Default: *None*

### `scale_in_cpu_threshold`

- Description: CPU threshold for scale-in
- Type: `number`
- Default: *None*



Example
Here's an example configuration using the module:


module "autoscaling" {
  source             = "./modules/autoscaling"
  vpc_id             = "vpc-12345678"
  availability_zones = ["us-east-1a", "us-west-1b"]
  ami_id             = "ami-12345678"
  instance_type      = "t2.micro"
  min_size           = 1
  max_size           = 3
  desired_capacity   = 2
  scale_out_cpu_threshold = 70
  scale_in_cpu_threshold  = 30
}

output "autoscaling_group_arn" {
  value = module.autoscaling.autoscaling_group_arn
}

output "autoscaling_group_name" {
  value = module.autoscaling.autoscaling_group_name
}

## To-Do

- [ ] Implement SQS queue creation.
- [ ] Configure autoscaling policies based on SQS queue metrics.
- [ ] Test and validate the autoscaling behavior.
- [ ] Customize the module according to your specific requirements.
- [ ] Update the `variables.tf` file to include additional configuration options if needed.
