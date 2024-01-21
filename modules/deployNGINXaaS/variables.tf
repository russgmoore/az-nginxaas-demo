variable "location" {
  type        = string
  description = "Azure Region objects are deployed into"
}

variable "sku" {
  description = "SKU of NGINXaaS deployment"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
}

variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
}

variable "nginx_user_id" {
  type = string
  description = "Managed NGINXaas user identity"
}

variable "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  type = string
}

variable "nginx_frontend_public_ip_id" {
  description = "ID of the NGINXaaS frontend public IP."
  type = string
}

variable "nginx_subnet_id" {
  description = "ID of the NGINXaaS Subnet."
  type = string
}
