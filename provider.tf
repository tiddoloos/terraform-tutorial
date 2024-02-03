terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.88.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-microservices-shd-we"
    storage_account_name = "stmicroservicesshdwe"
    container_name       = "scmicroservicesshdwe"
    key                  = "terraform/tutorial/tf-state-tutorial-"
  }
}

provider "azurerm" {
  features {}
}