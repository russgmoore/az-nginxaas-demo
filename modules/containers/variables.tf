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

variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

# Create a variable to hold the resource group name
variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "az_container_subnet_id" {
  description = "Subnet assigned for Containers"
  type        = string
  default     = "containersubnet"
}

# Varirable for our unique postfix when naming
variable "pf" {
  type        = string
  description = "Unique Deployment postfix"
}