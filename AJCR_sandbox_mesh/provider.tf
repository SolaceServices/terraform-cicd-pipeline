terraform {
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