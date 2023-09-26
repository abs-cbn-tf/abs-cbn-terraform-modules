resource "aws_opensearch_domain" "example" {
  domain_name           = var.cluster_name
#  elasticsearch_version = "7.10"
  cluster_config {
    instance_type = var.instance_type
  }
  access_policies = var.access_policies
  tags = var.tags
}

resource "aws_iam_role" "opensearch_role" {
  name = "opensearch_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "es.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "opensearch_policy_attachment" {
   name       = "opensearch_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonESCognitoAccess"
  roles      = [aws_iam_role.opensearch_role.name]
}

/* resource "aws_iam_instance_profile" "opensearch_instance_profile" {
  name = "opensearch_instance_profile"
  role = aws_iam_role.opensearch_role.name
} */

output "cluster_endpoint" {
  value = aws_opensearch_domain.example.endpoint
}

