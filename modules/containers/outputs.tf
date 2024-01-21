output "container1_ip" {
  description = "The private IP for container 1"
  value = azurerm_container_group.container1.ip_address
}

output "container2_ip" {
  description = "The private IP for container 2"
  value = azurerm_container_group.container2.ip_address
}
