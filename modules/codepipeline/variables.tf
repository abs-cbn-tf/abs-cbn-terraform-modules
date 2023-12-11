# variable "sg_configurations" {
#   type = object({
#     sg_name        = string
#     sg_description = string

#     ingress_rules = list(object({
#       from_port   = number
#       to_port     = number
#       protocol    = string
#       cidr_blocks = list(string)
#       self        = bool
#     }))
#     egress_rules = list(object({
#       from_port   = number
#       to_port     = number
#       protocol    = string
#       cidr_blocks = list(string)
#       self        = bool
#     }))

#     sg_tags = map(string)
#   })
# }

variable "include_deploy_stage" {
  type = bool
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
