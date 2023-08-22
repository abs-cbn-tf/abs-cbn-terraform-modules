# Terraform AWS EC2 Instance Configuration

This Terraform configuration sets up an EC2 instance in the AWS environment using a module.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed locally
- AWS account credentials configured
- Replace placeholder values with your desired configuration details

## Usage

1. Clone the repository:

   ```shell
   git clone <repository-url>
   ```

```shell

This Terraform configuration sets up the AWS provider and defines an EC2 instance module. Here's a breakdown of the code:

AWS Provider Configuration:

The provider block configures the AWS provider.
Replace the region value with your desired AWS region.
Optionally, modify the profile if you are using a named profile other than the default.
EC2 Instance Module:

The module block specifies the ec2_instance module defined in the (./ec2-instance-module) directory.
Replace the region value with your desired AWS region.

role_name: specifies the name of the IAM role to be associated with the EC2 instance.

role_assume_policy: defines the trust policy allowing EC2 to assume the specified IAM role.

policy_arn: is the ARN of the IAM policy to be attached to the IAM role.

ami specifies the ID of the Amazon Machine Image (AMI) to use for the EC2 instance.
instance_type defines the EC2 instance type. 
```

#Module Inputs

region: The AWS region where the EC2 instance will be created.

role_name: The name of the IAM role associated with the EC2 instance.

role_assume_policy: The trust policy allowing EC2 to assume the specified IAM role.

policy_arn: The ARN of the IAM policy to be attached to the IAM role.

ami: The ID of the Amazon Machine Image (AMI) to use for the EC2 instance.

instance_type: The EC2 instance type.

key_name: The name of the key pair used for SSH access to the instance.

instance_tags: A map of tags to be assigned to the EC2 instance.


Note: Make sure to replace the placeholder values with your own values according to your requirements.

Please refer to the appropriate module documentation for further information on the ec2-instance-module used in this example. 

#Below components can be created :

 >Creates: the IAM policy, ec2 instance, Creates instance profile
 
 >Configure: Attach the policy and Deletes the policy.
 
 >Modify: Update the profile , policy


#Usage

```bash
terraform plan
```

Above command will list the resources thats need to be created


```bash
terraform apply -target=module.ec2_instance.aws_iam_role.ec2_role
```

Above command will create the ec2 role 


```shell
terraform apply -target=module.ec2_instance.aws_iam_instance_profile.ec2_instance_profile
```

Above command will attach instance profile to the ec2 instance

```shell
terraform destroy
```

Above command will destroy all the resource which has been created.
