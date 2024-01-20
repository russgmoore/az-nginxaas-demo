
output "linux_demoapp1_private_ip" {
  description = "Linux Demostration application 1 private IP address"
  value       = azurerm_linux_virtual_machine.linuxapp-1.private_ip_address
}

output "linux_demoapp2_private_ip" {
  description = "Linux Demostration application 2 private IP address"
  value       = azurerm_linux_virtual_machine.linuxapp-2.private_ip_address
}