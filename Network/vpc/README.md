# Terraform AWS VPC Configuration

This Terraform configuration sets up a VPC with associated subnets, security groups, and routing tables in the AWS environment.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed locally
- AWS account credentials configured
- Replace placeholder values with your desired configuration details

## Usage

1. Clone the repository:

   ```shell
   git clone <repository-url>





Modify the Terraform code in main.tf with your desired configuration details:

AWS provider configuration: Replace the region value with your desired AWS region and configure the appropriate profile.

VPC configuration: Modify the VPC's cidr_block and tags according to your requirements.

Security Group configuration: Adjust the name, description, ingress, and egress rules to meet your needs.

Subnet configuration: Customize the subnet configurations for the desired availability zones, associating them with the appropriate route tables.

Route Table configuration: Customize the route tables, routes, and associations for public and private subnets.


# Module Inputs

**The module inputs are defined within the main.tf file and can be modified according to your requirements. Some of the key inputs include:**

>region: The AWS region where the VPC and associated resources will be created

>vpc_cidr: The CIDR block for the VPC.

>egress_cidr_blocks: The list of CIDR blocks for egress traffic.

>Customize the inputs for subnets, security groups, and route tables according to your needs.



**Below are the components which can be created .**

>VPC: - create , update , delete and add multiple vpc's

>Private Subnets: - create private subnets , update cidr subnets , delete

>Public Subnets: - Create public subnets , modify subnets , destroy

>Nat Gateway: - Create , Delete 

>Internet Gateway: - Create, destroy

**Usage** 

```shell

Terraform plan 

The above command will give the detailed output of the resources which is going to create 
```

```bash
Terraform apply 

will implement and execute the resources.
```

## Creating one vpc by below command

```bash
terraform apply target=module.vpc
```

## Creating Second VPC

```bash
 terraform apply target=module.vpc2
```

# Creating complete vpc's

```bash
terraform apply
```

# To Destroy

```bash
terraform destroy 
```

# To destroy one vpc

```bash
terraform destroy -target=module.vpc
```


# To Create one subnet 

```bash
terraform apply -target=module.vpc.aws_subnet.private_app_subnet_az1
```
