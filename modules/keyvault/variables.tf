variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

variable "location" {
  type        = string
  description = "Azure Region objects are deployed into"
  default     = "eastus"
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  type = string
  default = "nginxaasprincipalid"
}