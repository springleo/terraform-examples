variable "prefix" {
  description = "Test variable"
  default = "mmikkili"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default = "mmikkili-subnet"  
}

variable "public_ip_name" {
  description = "Name of the public IP"
  default = "mmikkili-public-ip"
}

variable "location" {
  description = "location/region"
  default = "East US"
}
variable "nic_name" {
  description = "Name of the NIC"
  default = "mmikkili-nic"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default = "mmikkili-rg"
}

variable "vnet_name" {
  description = "Name of the vnet"
  default = "mmikkili-vnet"    
}
variable "vnet_address_space" {
  description = "VNET CIDR range"
  default = "10.0.0.0/16"
}
variable "subnet_address_space" {
  description = "SUBNET CIDR range"
  default = "10.0.2.0/24"
}

variable "vm_name" {
  description = "Name of the VM"  
  type = string
}