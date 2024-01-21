variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
  default     = "registry.hub.docker.com/ealen/echo-server:latest"
  #default     = "mcr.microsoft.com/azuredocs/aci-helloworld"
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 80
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to each container."
  default     = 1
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to each container in gigabytes."
  default     = 2
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}

variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
  default = {
    env   = "Development"
    Owner =  "addr@example.com"
  }
}

variable "instance_size" {
  type        = string
  description = "Azure Linux VM instance size"
  default     = "Standard_B1ls"
}

variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
}

variable "location" {
  type        = string
  description = "Azure Region objects will be deployed into"
  default     = "eastus"
}

variable "sku" {
  description = "SKU of NGINXaaS deployment"
  default     = "standard_Monthly"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "nginx_user_id" {
  type = string
  description = "Managed NGINXaas user identity"
  default = "managednginxaasuserid"
}

variable "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  type = string
  default = "nginxaasprincipalid"
}

variable "nginx_frontend_public_ip_id" {
  description = "ID of the NGINXaaS frontend public IP."
  type = string
  default = "nginxaasfrontendpubipid"
}

variable "nginx_subnet_id" {
  description = "The ID of the NGINXaaS Subnet."
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
  default     = true
}