variable "location" {
  type        = string
  description = "Azure Region objects are deployed into"
  default     = "eastus"
}

variable "sku" {
  description = "SKU of NGINXaaS deployment"
  default     = "standard_Monthly"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
}

variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

variable "nginx_user_id" {
  type = string
  description = "Managed NGINXaas user identity"
  default = "managednginxaasuserid"
}

variable "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  type = string
  default = "nginxaasprincipalid"
}

variable "nginx_frontend_public_ip_id" {
  description = "ID of the NGINXaaS frontend public IP."
  type = string
  default = "nginxaasfrontendpubipid"
}

variable "nginx_subnet_id" {
  description = "ID of the NGINXaaS Subnet."
  type = string
  default = "nginxaassubnet"
}
