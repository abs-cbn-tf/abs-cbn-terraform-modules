variable "kms_keys" {
  type = list(object({
    name            = string
    description     = string
    deletion_window = number
  }))
}

variable "env1" {}
variable "project1" {}

#variable "env" { 
# default = "dev"
#}

#variable "project" {
# default = "kms-project"
#}
