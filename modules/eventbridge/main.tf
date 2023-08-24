resource "aws_cloudwatch_event_rule" "example_rule" {
  count = var.eventbridge_count

  name           = var.eventbridge_configuration[count.index].name
  description    = var.eventbridge_configuration[count.index].description
  event_bus_name = var.eventbridge_configuration[count.index].event_bus_name

  schedule_expression = var.eventbridge_configuration[count.index].scheduled_expression
}

resource "aws_cloudwatch_event_target" "example_target" {
  count = var.eventbridge_count

  rule      = aws_cloudwatch_event_rule.example_rule[count.index].name
  target_id = var.target_id[count.index]
  arn       = var.target_arn[count.index]
}

resource "aws_lambda_permission" "eventbridge_invoke_permission" {
  count = var.eventbridge_count

  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.target_id[count.index]
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.example_rule[count.index].arn
}
