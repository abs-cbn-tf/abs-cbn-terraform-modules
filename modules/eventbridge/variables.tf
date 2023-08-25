variable "eventbridge_configuration" {
  description = "List of cloudwatch events configurations"
  type = list(object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
    event_pattern        = string
  }))
}

variable "target_id" {
  type = list(string)
}

variable "target_arn" {
  type = list(string)
}

variable "eventbridge_count" {
  type = number
}
