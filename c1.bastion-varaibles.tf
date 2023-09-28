/*# Bastion Linux VM Input Variables Placeholder file.
variable "bastion_service_subnet_name" {
  description = "Bastion Service Subnet Name"
  default = "AzureBastionSubnet"
}
##bastion host subnet name should be always AzureBastionSubnet

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  default = ["10.0.101.0/27"]
}
# Bastion / Management Subnet Name
variable "bastion_subnet_name" {
  description = "Virtual Network Bastion Subnet Name"
  type = string
  default = "bastionsubnet"
}
# Bastion / Management Subnet Address Space
variable "bastion_subnet_address" {
  description = "Virtual Network Bastion Subnet Address Spaces"
  type = list(string)
  default = ["10.0.100.0/24"]
}


*/