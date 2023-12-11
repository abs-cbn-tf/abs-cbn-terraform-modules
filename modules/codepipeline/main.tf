resource "aws_codepipeline" "codepipeline" {
  name     = "content-api-build-deploy"
  role_arn = data.aws_iam_role.selected.arn

  artifact_store {
    location = data.aws_s3_bucket.selected.id
    type     = "S3"

    # encryption_key {
    #   id   = data.aws_kms_alias.s3kmskey.arn
    #   type = "KMS"
    # }
  }

  stage {
    name = var.codepipeline_source_configuration.name
    dynamic "action" {
      for_each = var.codepipeline_source_configuration.source_action_config
      content {
        name             = action.value.name
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeStarSourceConnection"
        version          = "1"
        run_order        = action.value.run_order
        output_artifacts = action.value.output_artifacts

        configuration = {
          ConnectionArn    = data.aws_codestarconnections_connection.example.arn
          FullRepositoryId = action.value.configuration[0].FullRepositoryId
          BranchName       = action.value.configuration[0].BranchName
        }
      }
    }
  }

  stage {
    name = var.codepipeline_build_configuration.name
    action {
      name      = var.codepipeline_build_configuration.approval_action_name
      category  = "Approval"
      owner     = "AWS"
      provider  = "Manual"
      version   = "1"
      run_order = var.codepipeline_build_configuration.approval_run_order
    }

    dynamic "action" {
      for_each = var.codepipeline_build_configuration.build_action_config
      content {
        name             = action.value.name
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = action.value.input_artifacts
        output_artifacts = action.value.output_artifacts
        version          = "1"
        run_order        = action.value.run_order

        configuration = {
          ProjectName = action.value.configuration[0].ProjectName
          EnvironmentVariables = jsonencode([
            for env_var in action.value.configuration[0].EnvironmentVariables :
            {
              name  = env_var.name
              value = env_var.value
              type  = env_var.type
            }
          ])
        }
      }
    }
  }
  // Include deploy stage only if the variable is set to true
  dynamic "stage" {
    for_each = range(var.include_deploy_stage ? 1 : 0)
    content {
      name = "Deploy"

      action {
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "ECS"
        version         = "1"
        input_artifacts = ["BuildArtifact"]

        configuration = {
          ClusterName = "your-ecs-cluster-name"
          ServiceName = "your-ecs-service-name"
        }
      }
    }
  }
}


data "aws_codestarconnections_connection" "example" {
  arn = "arn:aws:codestar-connections:ap-southeast-1:892339339186:connection/a31c8332-3fca-4843-aaa7-65dcfd2e7c28"
}


data "aws_s3_bucket" "selected" {
  bucket = "codepipeline-ap-southeast-1-551851825504"
}

# resource "aws_s3_bucket" "codepipeline_bucket" {
#   bucket = "test-bucket"
# }

data "aws_iam_role" "selected" {
  name = "AWSCodePipelineServiceRole-ap-southeast-1-rjperez"
}

# resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
#   bucket = aws_s3_bucket.codepipeline_bucket.id
#   acl    = "private"
# }

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["codepipeline.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "codepipeline_role" {
#   name               = "test-role"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# data "aws_iam_policy_document" "codepipeline_policy" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "s3:GetObject",
#       "s3:GetObjectVersion",
#       "s3:GetBucketVersioning",
#       "s3:PutObjectAcl",
#       "s3:PutObject",
#     ]

#     resources = [
#       aws_s3_bucket.codepipeline_bucket.arn,
#       "${aws_s3_bucket.codepipeline_bucket.arn}/*"
#     ]
#   }

#   statement {
#     effect    = "Allow"
#     actions   = ["codestar-connections:UseConnection"]
#     resources = [aws_codestarconnections_connection.example.arn]
#   }

#   statement {
#     effect = "Allow"

#     actions = [
#       "codebuild:BatchGetBuilds",
#       "codebuild:StartBuild",
#     ]

#     resources = ["*"]
#   }
# }

# resource "aws_iam_role_policy" "codepipeline_policy" {
#   name   = "codepipeline_policy"
#   role   = aws_iam_role.codepipeline_role.id
#   policy = data.aws_iam_policy_document.codepipeline_policy.json
# }

# data "aws_kms_alias" "s3kmskey" {
#   name = "alias/myKmsKey"
# }
