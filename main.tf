
resource "azurerm_resource_group" "rg" {
  name     = "ru-moore-nginx1"
  location = var.location
  tags = var.tags
}

resource "azurerm_user_assigned_identity" "id-nginxaas" {
  location            = azurerm_resource_group.rg.location
  name                = "id-nginxaas"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

resource "azurerm_network_security_group" "sg-allowedin" {
  name                = "sg-allowedin"
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

  tags = var.tags
}

resource "azurerm_public_ip" "ngxaas-publicip" {
  name                = "ngxaas-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "nginxvnet" {
  name                = "nginxvnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

resource "azurerm_subnet" "nginx-subnet" {
  name                 = "nginx-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.nginxvnet.name
  address_prefixes     = ["10.0.1.0/24"]
  delegation {
    name = "nginx"
    service_delegation {
      name = "NGINX.NGINXPLUS/nginxDeployments"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "sg-assoc" {
  subnet_id                 = azurerm_subnet.nginx-subnet.id
  network_security_group_id = azurerm_network_security_group.sg-allowedin.id
}

resource "azurerm_public_ip" "webserver1_public_ip" {
  name                = "webserver1_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "webserver1" {
  name                = "nginx-interface1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx-subnet.id
    public_ip_address_id          = azurerm_public_ip.webserver1_public_ip.id
    private_ip_address            = "10.0.1.10"
  }

  depends_on = [azurerm_resource_group.rg]

  tags = var.tags
}


resource "azurerm_public_ip" "webserver2_public_ip" {
  name                = "webserver2_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "webserver2" {
  name                = "nginx-interface2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx-subnet.id
    public_ip_address_id          = azurerm_public_ip.webserver2_public_ip.id
    private_ip_address            = "10.0.1.11"
  }

  depends_on = [azurerm_resource_group.rg]

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "nginx1" {
  size                = var.instance_size
  name                = "nginx-webserver1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  #user_data = data.cloudinit_config.server_config.rendered
  custom_data = base64encode(templatefile("userdata.tftpl", { nginxinstance = 1 } )) 
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

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_linux_virtual_machine" "nginx2" {
  size                = var.instance_size
  name                = "nginx-webserver2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  #user_data = data.cloudinit_config.server_config.rendered
  custom_data = base64encode(templatefile("userdata.tftpl", { nginxinstance = 2 } )) 
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

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_nginx_deployment" "nginxaas-demo" {
  name                     = "nginxaas-demo"
  resource_group_name      = azurerm_resource_group.rg.name
  sku                      = var.sku
  location                 = var.location
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.id-nginxaas.id]
  }

  frontend_public {
    ip_address = [azurerm_public_ip.ngxaas-publicip.id]
  }
  network_interface {
    subnet_id = azurerm_subnet.nginx-subnet.id
  }

  tags = var.tags
}
