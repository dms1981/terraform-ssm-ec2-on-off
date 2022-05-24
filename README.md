# terraform-ssm-ec2-on-off
Use AWS SSM to power EC2 instances on and off

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.ssm_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ssm_association.start_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_ssm_association.stop_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.dlm_lifecycle_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_document.start_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_document) | data source |
| [aws_ssm_document.stop_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, EG. Development | `any` | n/a | yes |
| <a name="input_schedule_expressions"></a> [schedule\_expressions](#input\_schedule\_expressions) | n/a | `map(string)` | <pre>{<br>  "start_instance": "cron(0 7 * * MON-FRI *)",<br>  "stop_instance": "cron(0 19 * * MON-FRI *)"<br>}</pre> | no |
| <a name="input_service"></a> [service](#input\_service) | Name of service to use this module. EG. SuperCaliFragiListic | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply | `map(any)` | n/a | yes |
| <a name="input_targets"></a> [targets](#input\_targets) | n/a | `map` | <pre>{<br>  "key": "tag:is-production",<br>  "values": [<br>    "false"<br>  ]<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->