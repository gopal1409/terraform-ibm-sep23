variable "resource_group_name" {
  description = "resource group name"
  type = string 
  default = "myrg"
}
variable "business_unit" {
  description = "business unit name"
  type = string 
  default = "hr"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "resource_group_location" {
  type = string 
  default = "eastus"
}