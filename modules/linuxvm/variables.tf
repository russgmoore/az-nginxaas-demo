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
  description = "Azure Region used for deployed objects"
  default     = "eastus"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
  default = "somerandomstring"
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
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