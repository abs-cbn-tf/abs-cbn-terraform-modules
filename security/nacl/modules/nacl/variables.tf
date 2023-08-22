variable "name" {
  description = "The name of the NACL."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the NACL will be associated."
  type        = string
}

#variable "ingress_rules" {
#  description = "A list of ingress TCP rules."
#  type        = list(object({
#    from_port   = number
#    to_port     = number
#    cidr_blocks = list(string)
#  }))
#}


variable "ingress_rules" {
  description = "A list of ingress TCP rules."
  type        = list(object({
    from_port   = number
    to_port     = number
    cidr_block  = string  # Use "cidr_block" instead of "cidr_blocks"
  }))
}



variable "egress_rules" {
  description = "A list of egress TCP rules."
  type        = list(object({
    from_port   = number
    to_port     = number
    cidr_block = string
  }))
}


variable "nacl_tags" {
  type    = map(string)
  default = {
    env = "dev"
    project = "naclproject"
    foo = "bar"
    # Add more tags as needed
  }
}
