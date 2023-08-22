variable "region" {
  description = "The AWS region"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "role_assume_policy" {
  description = "The assume role policy for the IAM role"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the IAM policy to attach"
  type        = string
}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

#variable "instance_tags" {
#  description = "Additional tags for the EC2 instance"
#  type        = map(string)
#}

variable "instance_tags" {
  type    = map(string)
  default = {
    env = "dev"
    project = "servicerole"
    foo = "bar"
 
    # Add more tags as needed
  }
}


