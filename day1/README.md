Creating a Resource Group is the fundamental first step in managing Azure infrastructure with Terraform. It’s a straightforward process, but getting your provider configuration right is key.

Here is the step-by-step guide to making it happen.

1. The Prerequisites
Before you run any code, ensure you have:

Terraform CLI installed on your machine.

Azure CLI installed and authenticated via az login.

An active Azure Subscription.

2. Define the Terraform Code
Create a file named main.tf. You need two main blocks: the Provider (to tell Terraform it's talking to Azure) and the Resource (the actual group).

Terraform:

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

3. Deploy the Infrastructure
Open your terminal in the folder where you saved main.tf and run these three commands:

A. Initialize
This downloads the necessary Azure plugins.

bash
terraform init

B. Plan
This shows you exactly what Terraform intends to do without actually changing anything yet. It's your "safety check."

bash
terraform plan

C. Apply
This executes the plan. You will be prompted to type yes to confirm.

bash
terraform apply

Key Components Explained
Component		Description

azurerm_resource_group  The resource type recognized by the AzureRM provider.

example                 The local name used to reference this resource within your Terraform code.

name                    The actual name that will appear in the Azure Portal.

location                The Azure region (e.g., East US, West Europe) where the metadata is stored.
