provider "azurerm" {
  subscription_id = "620aa499-e939-4c88-a005-e871c356f8a6"
  tenant_id = "566fec95-405b-4c65-bbfe-71bd6191a358"
  features {
    }
}

resource "azurerm_resource_group" "example" {
    name     = "example-resources"
    location = var.location
}

module "create_linux_vm_1" {
  source = "./modules/create_linux_vm"

  # Add any required variables for the module here
  vm_name = var.vm_config["vm1"]
  location = var.regions["region1"]
  resource_group_name = azurerm_resource_group.example.name
  nic_name            = var.vm_config["vm1_nic"]
  vnet_name =  var.vm_config["vm1_vnet_name"]
  subnet_name = var.vm_config["vm1_subnet_name"]  
  public_ip_name = var.vm_config["vm1_public_ip"]
  vnet_address_space = var.vm_config["vm1_vnet_address_space"]
  subnet_address_space = var.vm_config["vm1_subnet_address_space"]
}

module "create_linux_vm_2" {
  source = "./modules/create_linux_vm"

  # Add any required variables for the module here
  vm_name = var.vm_config["vm2"]
  location = var.regions["region2"]
  resource_group_name = azurerm_resource_group.example.name
  nic_name            = var.vm_config["vm2_nic"]
  vnet_name =  var.vm_config["vm2_vnet_name"]
  subnet_name = var.vm_config["vm2_subnet_name"]  
  public_ip_name = var.vm_config["vm2_public_ip"]
  vnet_address_space = var.vm_config["vm2_vnet_address_space"]
  subnet_address_space = var.vm_config["vm2_subnet_address_space"]
}
