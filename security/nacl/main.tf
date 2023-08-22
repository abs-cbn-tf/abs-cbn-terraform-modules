module "nacl" {
  source = "./modules/nacl"

  name   = "my-nacl"
  vpc_id = "vpc-0c4c53580589f19b8"
  nacl_tags   = {
    env = var.env
    project = var.project
    foo = var.foo
    # Add more tags as needed
  }
  ingress_rules = [
    {
      from_port  = 80
      to_port    = 80
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port  = 443
      to_port    = 443
      cidr_block = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      from_port  = 0
      to_port    = 65535
      cidr_block = "0.0.0.0/0"
    }
  ]
}


module "nacl2" {
  source = "./modules/nacl"

  name   = "my-nacl2"
  vpc_id = "vpc-0c4c53580589f19b8"

  ingress_rules = [
    {
      from_port  = 90
      to_port    = 90
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port  = 4431
      to_port    = 4431
      cidr_block = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      from_port  = 0
      to_port    = 65535
      cidr_block = "0.0.0.0/0"
    }
]
}
