variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}

variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
}

variable "location" {
  type        = string
  description = "Azure Region objects are deployed into"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
}

variable "az_container_subnet_id" {
  description = "Subnet assigned for Containers"
  type        = string
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
}