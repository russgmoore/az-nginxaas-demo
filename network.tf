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

resource "azurerm_public_ip" "pip-ngxaas" {
  name                = "ngxaas-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
}

resource "azurerm_virtual_network" "vnet-nginx" {
  name                = "nginxvnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

resource "azurerm_subnet" "nginx-subnet" {
  name                 = "nginx-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-nginx.name
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

resource "azurerm_public_ip" "pip-webserver1" {
  name                = "webserver1_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "int-webserver1" {
  name                = "nginx-interface1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx-subnet.id
    public_ip_address_id          = azurerm_public_ip.pip-webserver1.id
    private_ip_address            = "10.0.1.10"
  }

  depends_on = [azurerm_resource_group.rg]

  tags = var.tags
}


resource "azurerm_public_ip" "pip-webserver2" {
  name                = "webserver2_public_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_interface" "int-webserver2" {
  name                = "nginx-interface2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx-subnet.id
    public_ip_address_id          = azurerm_public_ip.pip-webserver2.id
    private_ip_address            = "10.0.1.11"
  }

  depends_on = [azurerm_resource_group.rg]

  tags = var.tags
}