resource "azurerm_virtual_network" "example" {
    name                = var.vnet_name
    address_space       = [var.vnet_address_space]
    location            = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
    name                 = var.subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.example.name
    address_prefixes     = [var.subnet_address_space]
}

resource "azurerm_network_interface" "example" {
    name                = var.nic_name
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {    
        name                          = "internal"
        subnet_id                     = azurerm_subnet.example.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id =  azurerm_public_ip.example.id   
    }
    depends_on = [ azurerm_public_ip.example ]
}
resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"  # You can choose "Dynamic" if needed
  sku                  = "Basic"  # Use "Standard" for higher availability
}
# locals {
#   vm_name = "${var.location}-vm"
# }

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.example.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  timeouts {
      create = "30m"
  }
  depends_on = [ azurerm_network_interface.example ]
}