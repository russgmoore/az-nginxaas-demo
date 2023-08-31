variable "location" {
  description = "Azure location name for NGINXaaS deployment."
  default     = "eastus"
}

variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  default     = "nginxaas-demo"
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env = "Dev"
    Owner = "ru.moore@f5.com"
  }
}