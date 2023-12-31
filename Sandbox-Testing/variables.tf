variable "aws_region" {}
variable "profile" {}

variable "function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}

variable "codepipeline_source_configuration" {
  type = object({
    name = string # "Source"

    source_action_config = list(object({
      name             = string       # "Source"
      run_order        = number       # 1
      output_artifacts = list(string) # ["SourceArtifact"]

      configuration = list(object({
        FullRepositoryId = string # "abs-cbn-dct/content-api"
        BranchName       = string # "integration"
      }))
    }))
  })
}

variable "codepipeline_build_configuration" {
  type = object({
    name = string # "Build"

    approval_action_name = string
    approval_run_order   = number

    build_action_config = list(object({
      name             = string
      run_order        = number
      input_artifacts  = list(string)
      output_artifacts = list(string)

      configuration = list(object({
        ProjectName = string # "Sandbox-DevSecOps-Build-Project"
        EnvironmentVariables = list(object({
          name  = string # "LAMBDA_NAME"
          value = string # "imp-content-api"
          type  = string # "PLAINTEXT"
        }))
      }))
    }))
  })
}

variable "include_deploy_stage" {
  type    = bool
  default = false
}
