variable "location" {
  description = "Azure location name for NGINXaaS deployment."
  default     = "eastus"
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env = "Dev"
    Owner = "ru.moore@f5.com"
  }
}

variable "name" {
  description = "Name of NGINXaaS deployment"
  default = "ngxaas"
}