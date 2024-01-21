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
  description = "Azure Region objects will be deployed into"
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

variable "my_ip_address" {
  type = string
  description = "Source IP of your machine to allow access to resources during demonstrations"
  default = "127.0.0.1"
}