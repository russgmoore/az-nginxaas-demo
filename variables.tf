# Define the size of the instances for our VMs we will build. For demos these shoudl be small
variable "instance_size" {
  type        = string
  description = "Azure instance size"
  default     = "Standard_B1ls"
}

# Define the region for our deployment. You probably want to make sure you use one close to you 
variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

# The public key we will push to our VMs. These should reside outside of your repo!
variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
  default     = "../sshkeys/azure_rsa_key.pub"
}

# Define which train we will deploy from for the NGINXaaS version
variable "sku" {
  description = "SKU of NGINXaaS deployment"
  default     = "standard_Monthly"
}

# Create a set of standard tags to put on all objects. Owner is required to be set properly or your stuff will be deleted
variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env   = "Development"
    Owner = "ru.moore@f5.com"
  }
}
