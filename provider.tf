terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 6.1"
    }
  }
  required_version = ">= 1.8"
}
 
provider "akamai" {
  config {
    client_secret = var.client_secret
    host          = var.host
    access_token  = var.access_token
    client_token  = var.client_token
  }
  # edgerc         = var.edgerc_path #"~/.edgerc"
  # config_section = var.config_section #"default"
}