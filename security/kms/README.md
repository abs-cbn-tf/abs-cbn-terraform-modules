**Modify the Terraform code in main.tf with your desired configuration details:**


AWS provider configuration: Replace the region value with your desired AWS region and configure the appropriate profile.

KMS key resource configuration: Adjust the count value based on the number of KMS keys you want to create.

KMS key attributes: Replace the description and deletion_window_in_days values with your desired configuration.

Output configuration: Modify the output value based on your needs.



**Resource Inputs**

The resource inputs are defined within the main.tf file and can be modified according to your requirements. Some of the key inputs include:

>description: The description of the KMS key.

>deletion_window_in_days: The number of days the KMS key is retained before it is deleted.

> tags: Additional tags to assign to the KMS key.

**Outputs**

>The outputs section in main.tf defines the output value for the KMS key ARNs. Modify the output configuration as needed.

Below Components can be created: 

**KMS** : 

> Creates: KMS Key, multiple kms key

> Delete: KMS Key

> Modify:  Update the Deletion window 


# Usage 


```bash
Terraform plan 
```

Above command will give you the list of resources creation 


```bash
terraform apply
```

Above command will creates the KMS keys 


```bash
terraform apply -target=module.kms.aws_kms_key.kms
```

Above command will create single kms key and we can use same command for creating multiple keys


```bash

terraform destroy
```

Above command will delete all other kms keys.


