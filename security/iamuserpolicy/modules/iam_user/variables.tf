variable "iam_user_name" {
  type        = string
  description = "Name of the IAM user"
}

variable "iam_policies" {
  type = list(object({
    name        = string
    description = string
    policy      = string
  }))
}


#variable "iam_policies" {
#  type = list(object({
#    policy_arn = string
#  }))
#  description = "List of IAM policies to attach to the IAM user."
#}


variable "env" {
 default = "qa"
}

variable "project" {
  default = "iamproject"
}

variable "foo" {
 default = "bar"
}
  
