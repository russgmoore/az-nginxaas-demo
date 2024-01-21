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

variable "configure" {
  description = "Workaround for Bug ID-891. Set false to skip configuration."
  default     = false
}