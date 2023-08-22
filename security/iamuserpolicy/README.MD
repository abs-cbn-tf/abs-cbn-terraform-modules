# Terraform IAM User and Policy Configuration

This Terraform configuration creates an IAM user and attaches IAM policies to the user. It also provides an output value for the IAM user name.

## Prerequisites

Before using this Terraform module, make sure you have the following prerequisites in place:

- Valid AWS credentials with appropriate permissions to create IAM resources.
- Terraform installed on your local machine or the desired execution environment.

## Usage

Follow the steps below to use this Terraform configuration:

1. Clone the repository and navigate to the project directory.

2. Open the `main.tf` file and update the following variables as per your requirements:

   - `var.iam_user_name`: The desired IAM user name.
   - `var.iam_policies`: A list of IAM policies to attach to the user. Each policy should include the following attributes:
     - `name`: The name of the policy.
     - `description`: The description of the policy.
     - `policy`: The policy document in JSON format.

3. Optionally, you can customize the IAM policy attachment process by modifying the `aws_iam_user_policy_attachment` resource block.

4. Initialize the Terraform working directory by running the following command:

   ```bash
   terraform init
   ```

**Below Components can be created :**

**IAM POLICY** : 

> Creates : User , Policy 
> Policy :  Attach policy, multiple policy 
> Changes: Update Policy and Remove Policy 


# Usage

```bash
Terraform apply 
```

Above command will create user , policy and attach to the user 



```bash
terraform apply -target=module.iam_user.aws_iam_user.iam_user
```

Above command will create only iam user 


```bash
terraform apply -target=module.iam_user.aws_iam_policy.iam_policy[0]
```

Above command will create iam policy 


```bash
terraform destroy -target=module.iam_user.aws_iam_user.iam_user[0]
```

Above command will delete the user like wise we can delete individual modules.

