###
output "virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.vnet.name 
  #resourcetype.resourcered.value
  #from where it get the details. it is geeting all this information from tfstate file. 
}
output "virtual_network_id" {
  description = "Virtual Network id"
  value = azurerm_virtual_network.vnet.id
}

output "web_subnet_name" {
  description = "websubnet Name"
  value = azurerm_subnet.websubnet.name 
}

output "web_subnet_id" {
  description = "websubnet id"
  value = azurerm_subnet.websubnet.id  
}