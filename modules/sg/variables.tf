variable "sg_configurations" {
  type = object({
    sg_name        = string
    sg_description = string

    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))

    sg_tags = map(string)
  })
}


variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}


