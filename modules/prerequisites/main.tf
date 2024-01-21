# see: https://docs.nginx.com/nginxaas/azure/getting-started/managed-identity/
resource "azurerm_user_assigned_identity" "id_nginxaas" {
  location            = var.location
  name                = "id_nginxaas-${var.mypet}"
  resource_group_name = var.resource_group_name 

  tags = var.tags
}

resource "azurerm_network_security_group" "sg_allowedin" {
  name                = "sg_allowedin-${var.mypet}"
  resource_group_name = var.resource_group_name
  location            = var.location

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
    source_address_prefix      = var.my_ip_address
    destination_address_prefix = "*"
  }

  tags = var.tags
}

# Create a public IP for NGINXaas
resource "azurerm_public_ip" "pip_ngxaas" {
  name                = "ngxaas_publicip-${var.mypet}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"
}

# Create a Virtual Network in our resource group and assign the parent IP space
resource "azurerm_virtual_network" "vnet_nginx" {
  name                = "nginxvnet-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

# Create the first subnet for the demo servers and NGINXaas to talk to each other with
resource "azurerm_subnet" "nginx_subnet" {
  name                 = "nginx_subnet-${var.mypet}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_nginx.name
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

# Create the first subnet for the containers
resource "azurerm_subnet" "container" {
  name                 = "container-${var.mypet}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_nginx.name
  address_prefixes     = ["10.0.2.0/24"]
  delegation {
    name = "container"
    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

# Associate the Network Security Group with the Subnet 
resource "azurerm_subnet_network_security_group_association" "sg_assoc" {
  subnet_id                 = azurerm_subnet.nginx_subnet.id
  network_security_group_id = azurerm_network_security_group.sg_allowedin.id
}

# Create a Public IP for the Demo_App_1 server so we can reach it
resource "azurerm_public_ip" "pip_demo_app_1" {
  name                = "demoapp1_publicip-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = var.tags

}

# Create the Demo_App1 webserver network interface
resource "azurerm_network_interface" "int_demo_app_1" {
  name                = "demoapp1_int-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx_subnet.id
    public_ip_address_id          = azurerm_public_ip.pip_demo_app_1.id
    private_ip_address            = "10.0.1.10"
  }

  tags = var.tags
}

# Create a Public IP for the Demo_App2 server so we can reach it
resource "azurerm_public_ip" "pip_demo_app_2" {
  name                = "demoapp2_publicip-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = var.tags
}

# Create the Demo_App2 webserver network interface
resource "azurerm_network_interface" "int_demo_app_2" {
  name                = "demoapp2_int-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Static"
    subnet_id                     = azurerm_subnet.nginx_subnet.id
    public_ip_address_id          = azurerm_public_ip.pip_demo_app_2.id
    private_ip_address            = "10.0.1.11"
  }
  tags = var.tags
}

