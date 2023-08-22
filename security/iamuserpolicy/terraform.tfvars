iam_user_name = "terraform-user-1"
iam_policies = [
  {
    name        = "my-policy-1"
    description = "My IAM Policy 1"
    policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::my-bucket/*"]
    }
  ]
}
EOF
  }
/*
  {
    name        = "my-policy-2"
    description = "My IAM Policy 2"
    policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ec2:Describe*"],
      "Resource": ["*"]
    }
  ]
}
EOF
  }
*/
]



iam_policies2 = [
  {
    name        = "my-policy-3"
    description = "My IAM Policy 3"
    policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::my-bucket/*"]
    }
  ]
}
EOF
  },
  {
    name        = "my-policy-4"
    description = "My IAM Policy 4"
    policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ec2:Describe*"],
      "Resource": ["*"]
    }
  ]
}
EOF
  }
]

env = "qa"
project = "iamuser1"
foo = "bar"


env1 = "dev"
project1 = "iamuser2"
foo1 = "bar1"

iam_user_name2 = "terraform-user-2"
