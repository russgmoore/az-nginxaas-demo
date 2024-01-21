# Create a variable that will contain the set of standard tags to put on all objects.
variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

# Create a variable that contains the Azure Region for this deployment
variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

# Varirable for our unique postfix when naming
variable "pf" {
  type        = string
  description = "Unique Deployment postfix"
}

# Create a variable to hold the resource group name
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