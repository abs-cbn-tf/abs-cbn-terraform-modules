
#Terraform AWS NACL Module

This Terraform module creates a Network Access Control List (NACL) in AWS. The NACL acts as a firewall for controlling inbound and outbound traffic to subnets within a VPC.




#Inputs

>Name:	Description	Type	Default	Required

>vpc_id:	The ID of the VPC where the NACL will be created	string	-	yes

>nacl_name:	The name of the NACL	string	-	yes

>nacl_subnet_ids:	List of subnet IDs to associate with the NACL	list(string)	-	yes

>ingress_rules:	List of ingress rules for the NACL	list(object)	[]	no

>egress_rules:	List of egress rules for the NACL	list(object)	[]	no

Outputs

nacl_id:	The ID of the created NACL
nacl_arn:	The ARN of the created NACL


#Features

Creates: new NACL or use an existing NACL
Configures: custom ingress and egress rules for the NACL
Modify: Associate the NACL with one or more subnets



#Usage

```bash
terraform apply -target=module.nacl.aws_network_acl_rule.ingress_rule
```

Above command will create single nacl 


```bash
terraform apply -target=module.nacl2.aws_network_acl_rule.ingress_rule
```

Above command will create another nacl 


```bash
terraform destroy -target=module.nacl2.aws_network_acl_rule.ingress_rule
```

Above command will destroy the nacl

