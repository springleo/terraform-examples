output "public_ips" {
    description = "The public IP addresses of the VMs"
    value       = azurerm_public_ip.example.ip_address
}

output "vm_name" {
    description = "The name of the VM"
    value       = azurerm_linux_virtual_machine.example.name
}