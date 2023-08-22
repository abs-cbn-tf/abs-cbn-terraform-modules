**Modify the Terraform code in main.tf with your desired configuration details:**

```shell
AWS provider configuration: Replace the region value with your desired AWS region and configure the appropriate profile.

Security Group module configuration: Adjust the source value to the module location.

Module input variables: Replace the vpc_id, name, description, and ingress_rules values with your desired configuration. ```shell

# Module Inputs

The module inputs are defined within the main.tf file and can be modified according to your requirements. Some of the key inputs include:

>vpc_id: The ID of the VPC where the security groups will be associated.

>name: The name of the security group.

>description: The description of the security group.

>ingress/egress_rules: The list of ingress rules defining the allowed traffic.




#Below components can be created .

>Creates: Security Group 

>Configure: Asscociate Sec Grp with Resource

>Modify: Manage Sec Grp rules and Update Existing Security Group
```


#Usage

```bash
terraform plan
```

Above command will list the resource needs to be created


```bash
terraform apply
```

Above command will creates and implements the sec group creations


```bash
terraform apply -target=module.security_group.aws_security_group.security_group
```

Above command will single security group if we have declared multiple sec groups.

```bash
terraform destroy 
```

Above command will delete all sec groups.

