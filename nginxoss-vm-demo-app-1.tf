
resource "azurerm_linux_virtual_machine" "linuxapp-1" {
  size                = var.instance_size
  name                = "linux_app1-${pet_name.pet.id}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  custom_data = base64encode(templatefile("userdata.tftpl", { nginxinstance = 1 }))
  network_interface_ids = [
    azurerm_network_interface.int_demo_app_1.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "demo-app-1"
  admin_username                  = "admin-user"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "admin-user"
    public_key = file("${var.ssh_key_file}")
  }

  os_disk {
    name                 = "demo_app_1_disk01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}
