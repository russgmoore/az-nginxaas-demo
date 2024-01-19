# Create the prefix for our resource groups
variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random value so name is unique in your Azure subscription."
}

# Create a container group  prefix
variable "container_group_name_prefix" {
  type        = string
  description = "Prefix of the container group name that's combined with a random value so name is unique in your Azure subscription."
  default     = "acigroup"
}

# Assign a prefix for container names
variable "container_name_prefix" {
  type        = string
  description = "Prefix of the container name that's combined with a random value so name is unique in your Azure subscription."
  default     = "aci"
}

# Container image to use. This is set to an Echo server to send back to the browser what was sent in the headers.
variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
  default     = "registry.hub.docker.com/ealen/echo-server:latest"
  #default     = "mcr.microsoft.com/azuredocs/aci-helloworld"
}

# This is the port the containers will listent on.
variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 80
}

# Rhe number of cpu cores we assign to each container
variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
  default     = 1
}

# Assign the containers memmory 
variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
  default     = 2
}

# Assign the container restart policy
variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
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