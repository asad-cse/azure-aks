# 1. Specify the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {} # This block is required even if empty
}

# 2. Define the Resource Group
resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "West US"
  
  tags = {
    environment = "dev"
  }
}
