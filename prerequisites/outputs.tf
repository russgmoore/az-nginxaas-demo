output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.rg.name
}

output "public_ip_address_id" {
  description = "ID of public IP address."
  value       = azurerm_public_ip.ngxaas-publicip.id
}

output "subnet_id" {
  description = "ID of delegated subnet."
  value       = azurerm_subnet.nginxvnet.id
}