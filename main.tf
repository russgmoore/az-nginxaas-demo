resource "azurerm_resource_group" "rg" {
  name     = "ru-moore-nginx1"
  location = var.location
  tags = {
    Owner = var.owner
  }
}
resource "azurerm_network_security_group" "allowedports" {
  name                = "allowedports"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "ssh"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = data.external.myipaddr.result.ip
    destination_address_prefix = "*"
  }

  tags = {
    Owner = var.owner
  }
}

resource "azurerm_public_ip" "webserver1_public_ip" {
  name                = "webserver1_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = {
    environment = var.environment
    owner       = var.owner
  }

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "webserver1" {
  name                = "nginx-interface1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.network.vnet_subnets[0]
    public_ip_address_id          = azurerm_public_ip.webserver1_public_ip.id
  }

  depends_on = [azurerm_resource_group.rg]

  tags = {
    Owner = var.owner
  }
}


resource "azurerm_public_ip" "webserver2_public_ip" {
  name                = "webserver2_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = {
    environment = var.environment
    owner       = var.owner
  }

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "webserver2" {
  name                = "nginx-interface2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.network.vnet_subnets[0]
    public_ip_address_id          = azurerm_public_ip.webserver2_public_ip.id
  }

  depends_on = [azurerm_resource_group.rg]

  tags = {
    Owner = var.owner
  }
}

resource "azurerm_linux_virtual_machine" "nginx1" {
  size                = var.instance_size
  name                = "nginx-webserver1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  #custom_data = base64encode(file("scripts/init.sh"))
  #custom_data = filebase64("html/cloud-init-testhtml.yml")
  #custom_data = base64encode(data.cloudinit_config.twofiles.rendered)
  user_data = data.cloudinit_config.server_config.rendered
  network_interface_ids = [
    azurerm_network_interface.webserver1.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "nginx1"
  admin_username                  = "ru-moore-user"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ru-moore-user"
    public_key = file("${var.ssh_key_file}")
  }

  os_disk {
    name                 = "nginxdisk01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = var.environment
    Owner       = var.owner
  }

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_linux_virtual_machine" "nginx2" {
  size                = var.instance_size
  name                = "nginx-webserver2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  #custom_data = base64encode(file("scripts/init.sh"))
  #custom_data = filebase64("html/cloud-init-testhtml.yml")
  #custom_data = base64encode(data.cloudinit_config.twofiles.rendered)
  user_data = data.cloudinit_config.server_config.rendered
  network_interface_ids = [
    azurerm_network_interface.webserver2.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "nginx2"
  admin_username                  = "ru-moore-user"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ru-moore-user"
    public_key = file("${var.ssh_key_file}")
  }

  os_disk {
    name                 = "nginxdisk02"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = var.environment
    Owner       = var.owner
  }

  depends_on = [azurerm_resource_group.rg]
}
