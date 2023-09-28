terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "~> 5.0"
    }
  }
  backend "azurerm" {
    ###storage resource group name
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstoragego"
    container_name = "tfstate"
    ##key is like when it create a tfstate file it is going to store the same with this name
    key = "web.tfstate"
  }
}

# Configure the AWS Provider
provider "azurerm" {
  features {
    #delete_os_disk_on_deletion = false
    #if you delet ethe vm the os disk will not be deleted. the default behaviour in azure is that you 
    ###delete the vm os disk get deleted automatically. 
  }
}