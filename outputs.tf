output "vnet_subnets" {
  value = module.network.vnet_subnets
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "nginx1_private_ip" {
  value = azurerm_linux_virtual_machine.nginx1.private_ip_address
}

output "nginx1_public_ip" {
  value = azurerm_linux_virtual_machine.nginx1.public_ip_address
}

output "nginx2_private_ip" {
  value = azurerm_linux_virtual_machine.nginx2.private_ip_address
}

output "nginx2_public_ip" {
  value = azurerm_linux_virtual_machine.nginx2.public_ip_address
}

output "ssh_key" {
  value = "The SSH key for access is the one in ${var.ssh_key_file}"
}

output "my_public_ip" {
  value = data.external.myipaddr.result.ip
}

output "ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = azurerm_nginx_deployment.nginxaas-demo.ip_address
}

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
  value       = azurerm_subnet.nginx-subnet.id
}