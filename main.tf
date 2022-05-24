resource "aws_iam_role" "ssm_role" {
  name               = lower(format("dlm-lifecycle-role-%s-%s", var.service, var.environment))
  assume_role_policy = data.aws_iam_policy_document.dlm_lifecycle_role.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole"
}

resource "aws_ssm_association" "start_instance" {
  name                = data.aws_ssm_document.start_instance.name
  schedule_expression = var.schedule_expressions["start_instance"]
  parameters          = { AutomationAssumeRole = aws_iam_role.ssm_role.arn }
  dynamic "targets" {
    for_each = var.targets
    content {
      key    = targets.value["key"]
      values = targets.value["values"]
    }
  }
  apply_only_at_cron_interval = true
}

resource "aws_ssm_association" "stop_instance" {
  name                = data.aws_ssm_document.stop_instance.name
  schedule_expression = var.schedule_expressions["stop_instance"]
  parameters          = { AutomationAssumeRole = aws_iam_role.ssm_role.arn }
  dynamic "targets" {
    for_each = var.targets
    content {
      key    = targets.value["key"]
      values = targets.value["values"]
    }
  }
  apply_only_at_cron_interval = true
}