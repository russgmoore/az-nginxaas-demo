# Create a variable that contains the Azure Region for this deployment
variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}


# Create a variable that will contain the NGINXaaS train to deploy
variable "sku" {
  description = "SKU of NGINXaaS deployment"
  default     = "standard_Monthly"
}

# Create a variable to hold the resource group name
variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

# Varirable for our unique postfix when naming
variable "pf" {
  type        = string
  description = "Unique Deployment postfix"
}

# Create a variable that will contain the set of standard tags to put on all objects.
variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

# Create a variable to contain the NGINXaaS managed user identity
variable "nginx_user_id" {
  type = string
  description = "Managed NGINXaas user identity"
  default = "managednginxaasuserid"
}

# Create a variable to contain the NGINXaaS user ID pricipal information"
variable "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  type = string
  default = "nginxaasprincipalid"
}

# Create a variable to contain the NGINXaaS frontend public IP ID"
variable "nginx_frontend_public_ip_id" {
  description = "ID of the NGINXaaS frontend public IP."
  type = string
  default = "nginxaasfrontendpubipid"
}

# Create a variable to contain the NGINXaaS Subnet ID"
variable "nginx_subnet_id" {
  description = "ID of the NGINXaaS Subnet."
  type = string
  default = "nginxaassubnet"
}
