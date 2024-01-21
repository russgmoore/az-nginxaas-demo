variable "tags" {
  description = "Tags used on objects created"
  type        = map(any)
}

variable "instance_size" {
  type        = string
  description = "Azure Linux VM instance size"
}

variable "ssh_key_file" {
  type        = string
  description = "File where existing SSH key is used for loading on instance"
}

variable "location" {
  type        = string
  description = "Azure Region used for deployed objects"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group Name"
}

variable "mypet" {
  type        = string
  description = "A unique string appended to ojbect names"
}

variable "linux_demoapp1_interface_id" {
  description = "Linux Demostration application 1 Interface ID"
  type        = string
}

variable "linux_demoapp2_interface_id" {
  description = "Linux Demostration application 2 Interface ID"
  type        = string
}