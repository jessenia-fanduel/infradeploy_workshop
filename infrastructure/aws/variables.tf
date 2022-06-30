variable "deploy_environment" {
  type        = string
  description = "The name of the AWS account the infrastructure is being deployed into"
}

variable "deploy_environment_id" {
  type        = string
  description = "The ID of the AWS account the infrastructure is being deployed into"
}

variable "deploy_context" {
  type        = string
  description = "The name of the context. Used to deploy multiple instances of a single collection of infrastructure resources into the same AWS account"
}

