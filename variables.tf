# These variables may be defined in terraform.tfvars. SSH Key must be defined
# Create a variable to contain the instance size used for building the VMs
variable "instance_size" {
  type        = string
  description = "Azure instance size"
  default     = "Standard_B1ls"
}

# Create a variable that contains the Azure Region for this deployment
variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

# Create a variable that contains the path to our SSH public key for our VMs.
variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
}

# Create a variable that will contain the NGINXaaS train to deploy
variable "sku" {
  description = "SKU of NGINXaaS deployment"
  default     = "standard_Monthly"
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

# Create variable to contain the name of the Azure Resource Group
variable "azure_rg_1" {
  description = "Resource group name to use"
  type = string
  default = "azure_rg_1_nginxass"
}

