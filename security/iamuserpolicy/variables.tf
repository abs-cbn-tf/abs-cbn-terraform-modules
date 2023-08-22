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


variable "iam_user_name2" {
  type        = string
  description = "Name of the IAM user"
}


variable "iam_policies2" {
  type = list(object({
    name        = string
    description = string
    policy      = string
  }))
}
variable "env" {}
# default = "qa" 
#}


variable "project" {}
# default = "imuser" 
#}


variable "foo" {}
 #default = "bar"
#}



variable "env1" {}
variable "project1" {}
variable "foo1" {}
