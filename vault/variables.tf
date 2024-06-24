variable "vault_token" {
  description = "Token used to authenticate against HashiCorp Vault."
  type        = string
  sensitive   = true
}

variable "oidc_client_id" {
  description = "ID of the client registered with the OIDC IdP."
  type        = string
  sensitive   = true
}

variable "oidc_client_secret" {
  description = "Secret of the client registered with the OIDC IdP."
  type        = string
  sensitive   = true
}

variable "oidc_discovery_url" {
  description = "URL of the OIDC discovery endpoint."
  type        = string
}
