variable "prefix" {
  description = "Test variable"
  default = "mmikkili"
}

variable "regions" {
  description = "Map of regions"
  type        = map(string)
  default     = {
    region1 = "southeastasia"
    region2 = "westus"
  }
}

variable "location" {
  description = "location/region"
  default = "East US"
}
variable "vm_config" {
  description = "Config VM"
  type        = map(string)
  default     = {
    vm1 = "SoutheastAsiaVM"
    vm2 = "WestUSVM"
    vm1_nic = "SoutheastAsiaNIC"
    vm2_nic = "WestUSNIC"
    vm1_public_ip = "SoutheastAsiaPublicIP"
    vm2_public_ip = "WestUSPublicIP"
    vm1_vnet_name = "SoutheastAsiaVNET"
    vm2_vnet_name = "WestUSVNET"
    vm1_vnet_address_space = "10.3.0.0/16"
    vm2_vnet_address_space = "10.0.0.0/16"
    vm1_subnet_address_space = "10.3.1.0/24"
    vm2_subnet_address_space = "10.0.1.0/24"
    vm1_subnet_name = "SoutheastAsiaSubnet"
    vm2_subnet_name = "WestUSSubnet"
  }  
}