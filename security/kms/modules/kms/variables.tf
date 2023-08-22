variable "kms_keys" {
  type = list(object({
    name            = string
    description     = string
    deletion_window = number
  }))
}

variable "env" { 
 default = "dev"
}

variable "project" {
 default = "kms-project"
}




variable "env1" { 
 default = "qa"
}

variable "project1" {
 default = "kms-project1"
}

#variable "kms_keys" {
#  type = list(object({
#    name = string
#  }))
#  default = [
#    { name = "KMS Key 1" },
#    { name = "KMS Key 2" },
#    { name = "KMS Key 3" }
#  ]
#}

