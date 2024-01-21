variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

variable "mypet" {
  type        = string
  description = "Unique Deployment postfix"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "my_ip_address" {
  type = string
  description = "Source IP of your machine to allow access to resources during demonstrations"
  default = "127.0.0.1"
}