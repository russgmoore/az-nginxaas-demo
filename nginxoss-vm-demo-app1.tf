
resource "azurerm_linux_virtual_machine" "nginx1" {
  size                = var.instance_size
  name                = "nginx-webserver1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  custom_data = base64encode(templatefile("userdata.tftpl", { nginxinstance = 1 }))
  network_interface_ids = [
    azurerm_network_interface.int-webserver1.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "nginx1"
  admin_username                  = "admin-user"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "admin-user"
    public_key = file("${var.ssh_key_file}")
  }

  os_disk {
    name                 = "nginxdisk01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}
