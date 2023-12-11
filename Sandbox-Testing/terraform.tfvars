aws_region = "ap-southeast-1"
profile    = "default"

function_configurations_1 = {
  function_name = "imp-content-api"
  iam_role_name = "kentico-news-service-lambda-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
  }
  lambda_tags = {
  }
}

codepipeline_source_configuration = {
  name = "Source"

  source_action_config = [{
    name             = "test_source"
    run_order        = 1
    output_artifacts = ["SourceArtifact"]

    configuration = [{
      FullRepositoryId = "abs-cbn-dct/content-api"
      BranchName       = "integration"
    }]
    },
    {
      name             = "test_source_2"
      run_order        = 1
      output_artifacts = ["SourceArtifact2"]

      configuration = [{
        FullRepositoryId = "abs-cbn-dct/page-api"
        BranchName       = "integration"
      }]
    }
  ]
}

codepipeline_build_configuration = {
  name = "Build"

  approval_action_name = "Approval"
  approval_run_order   = 1

  build_action_config = [{
    name             = "Build"
    run_order        = 2
    input_artifacts  = ["SourceArtifact"]
    output_artifacts = ["BuildArtifact"]

    configuration = [{
      ProjectName = "Sandbox-DevSecOps-Build-Project"
      EnvironmentVariables = [{
        name  = "LAMBDA_NAME"
        value = "imp-content-api"
        type  = "PLAINTEXT"
        },
        {
          name  = "IMAGE_REPO"
          value = "content-api-web"
          type  = "PLAINTEXT"
      }]
    }]
  }]

}

include_deploy_stage = false
