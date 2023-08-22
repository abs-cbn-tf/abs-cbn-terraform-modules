service_role_1_name               = "ServiceRole1"
service_role_1_assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
service_role_1_tags = {
  Name        = "ServiceRole1"
  Environment = "Development"
}

service_role_2_name               = "ServiceRole2"
service_role_2_assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
service_role_2_tags = {
  Name        = "ServiceRole2"
  Environment = "Production"
}

