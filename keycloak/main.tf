terraform {
  required_version = "~> 1.7"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 4.4"
    }
  }
}

provider "keycloak" {
  client_id     = var.client_id
  client_secret = var.client_secret
  url           = var.keycloak_url
}
