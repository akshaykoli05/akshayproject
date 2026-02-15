terraform {
  cloud {
    organization = "akshayInfra"   # Replace with your Terraform Cloud org name

    workspaces {
      name = "Dev"    # Replace with your workspace name
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source   = "./modules/resource_group"
  name     = "rg00r5"
  location = "East US"
  tags = {
    environment = "dev"
    owner       = "teamA"
  }
}