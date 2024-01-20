
# Create a variable that will contain the set of standard tags to put on all objects.
variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

# These variables may be defined in terraform.tfvars. SSH Key must be defined
# Create a variable to contain the instance size used for building the VMs
variable "instance_size" {
  type        = string
  description = "Azure instance size"
  default     = "Standard_B1ls"
}

# Create a variable that contains the path to our SSH public key for our VMs.
variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
}

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

# Varirable for our unique postfix when naming
variable "pf" {
  type        = string
  description = "Unique Deployment postfix"
}

variable "linux_demoapp1_interface_id" {
  description = "Linux Demostration application 1 Interface ID"
  type        = string
  default     = "defaultlinuxdemoapp1intid"
}

variable "linux_demoapp2_interface_id" {
  description = "Linux Demostration application 2 Interface ID"
  type        = string
  default     = "defaultlinuxdemoapp2intid"
}