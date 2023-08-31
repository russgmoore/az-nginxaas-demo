variable "instance_size" {
  type        = string
  description = "Azure instance size"
  default     = "Standard_B1ls"
}

variable "location" {
  type        = string
  description = "Region"
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
  default     = "../sshkeys/azure_rsa_key.pub"
}

variable "owner" {
  type        = string
  description = "Owner email for tag required for objects deployed"
  default     = "ru.moore@f5.com"
}