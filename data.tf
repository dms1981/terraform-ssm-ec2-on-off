data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "dlm_lifecycle_role" {
  statement {
    actions = ["sts:AssumeRole", ]
    principals {
      type        = "Service"
      identifiers = ["ssm.amazonaws.com"]
    }
  }
}

data "aws_ssm_document" "start_instance" {
  name = "AWS-StartEC2Instance"
}

data "aws_ssm_document" "stop_instance" {
  name = "AWS-StopEC2Instance"
}