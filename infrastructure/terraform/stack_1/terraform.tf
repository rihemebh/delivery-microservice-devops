terraform {
  required_version = "~>1.3.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.31.0"
    }
    

  }

  backend "azurerm" {
    resource_group_name  = "Devops-project"
    container_name       = "tfblob"
    storage_account_name = "terraformback"
    key                  = "infra-stack.json"
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}
