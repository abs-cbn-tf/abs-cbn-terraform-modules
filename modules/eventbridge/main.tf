resource "aws_cloudwatch_event_rule" "example_rule" {
  name                = var.eventbridge_configuration.name
  description         = var.eventbridge_configuration.description
  event_bus_name      = var.eventbridge_configuration.event_bus_name
  event_pattern       = var.eventbridge_configuration.event_pattern
  schedule_expression = var.eventbridge_configuration.scheduled_expression
  tags                = merge(var.tags, var.eventbridge_configuration.event_tags)
}


resource "aws_cloudwatch_event_target" "example_target" {
  rule      = aws_cloudwatch_event_rule.example_rule.name
  target_id = var.target_id
  arn       = var.target_arn
}

resource "aws_lambda_permission" "eventbridge_invoke_permission" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.target_id
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.example_rule.arn
}
