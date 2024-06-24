terraform {
  required_version = "~> 1.7"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.2"
    }
  }
}

provider "vault" {
  address = "https://vault.d3adb5.net"
  token   = var.vault_token
}
