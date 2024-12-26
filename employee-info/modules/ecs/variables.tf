variable "cluster_name" {}
variable "task_family" {}
variable "container_definitions_file" {}
variable "execution_role_arn" {}
variable "service_name" {}
variable "desired_count" {}
variable "subnets" { type = list(string) }
variable "security_groups" { type = list(string) }

