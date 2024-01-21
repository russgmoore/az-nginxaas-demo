
resource "azurerm_linux_virtual_machine" "linuxapp-1" {
  size                = var.instance_size
  name                = "linux_app1-${var.mypet}"
  resource_group_name = var.resource_group_name
  location            = var.location
  custom_data = base64encode(templatefile("${path.module}/userdata.tftpl", { nginxinstance = 1 }))
  network_interface_ids = [
    var.linux_demoapp1_interface_id,
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

}

resource "azurerm_linux_virtual_machine" "linuxapp-2" {
  size                = var.instance_size
  name                = "linux_app2-${var.mypet}"
  resource_group_name = var.resource_group_name
  location            = var.location
  custom_data         = base64encode(templatefile("${path.module}/userdata.tftpl", { nginxinstance = 2 }))
  network_interface_ids = [
    var.linux_demoapp2_interface_id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "demo-app-2"
  admin_username                  = "admin-user"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "admin-user"
    public_key = file("${var.ssh_key_file}")
  }

  os_disk {
    name                 = "demo_app_2_disk01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = var.tags
  
}