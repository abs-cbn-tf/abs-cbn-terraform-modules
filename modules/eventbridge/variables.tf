variable "eventbridge_configuration" {
  description = "List of cloudwatch events configurations"
  type = object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
    event_pattern        = string
    event_tags           = map(string)
  })
}

variable "target_id" {
  type = string
}

variable "target_arn" {
  type = string
}


variable "tags" {
  description = "A map of tags to assign to the S3 bucket"
  type        = map(string)
  default     = {} # By default, it's an empty map (no tags). You can change this if needed.
}

