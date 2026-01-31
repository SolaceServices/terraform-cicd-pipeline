terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    solacecloud = {
      source = "registry.terraform.io/solaceproducts/solacecloud"
      version = "0.2.1"
    }
    solacebroker = {
      source  = "SolaceProducts/solacebroker"
      version = "1.1.0"
    }
  }
}
provider "solacebroker" {
  url            = var.broker_url
  username       = var.broker_username
  password       = var.broker_password
}
