##3using terraform i want to create a resource
#it should start with resource
#resource "which resource i want to create" "reflable" 
resource "azurerm_resource_group" "myrg" {
  name     = "${var.business_unit}-${var.environment}-${var.resource_group_name}-gopal"
  location = var.resource_group_location
}
