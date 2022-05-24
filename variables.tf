variable "environment" {
  description = "Environment name, EG. Development"
}

variable "service" {
  description = "Name of service to use this module. EG. SuperCaliFragiListic"
}

variable "schedule_expressions" {
  type = map(string)
  default = {
    "start_instance" = "cron(0 7 * * MON-FRI *)",
    "stop_instance"  = "cron(0 19 * * MON-FRI *)",
  }
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(any)
}

variable "targets" {
  default = {
    "key" = "tag:is-production"
    "values" = ["false"]
  }
}