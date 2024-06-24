resource "vault_jwt_auth_backend" "oidc" {
  type = "oidc"
  path = "oidc"

  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  oidc_discovery_url = var.oidc_discovery_url
  default_role       = "reader"
}

resource "vault_jwt_auth_backend_role" "reader" {
  role_name = "reader"
  role_type = "oidc"

  verbose_oidc_logging = true

  backend = vault_jwt_auth_backend.oidc.path

  bound_audiences = [var.oidc_client_id]
  user_claim      = "preferred_username"
  groups_claim    = "groups"
  token_policies  = ["default", vault_policy.reader.name]

  bound_claims = {
    groups = "/Vault"
  }

  allowed_redirect_uris = [
    "https://vault.d3adb5.net/ui/vault/auth/oidc/oidc/callback",
    "https://vault.d3adb5.net/oidc/oidc/callback"
  ]
}

resource "vault_jwt_auth_backend_role" "admin" {
  role_name = "admin"
  role_type = "oidc"

  verbose_oidc_logging = true

  backend = vault_jwt_auth_backend.oidc.path

  bound_audiences = [var.oidc_client_id]
  user_claim      = "preferred_username"
  groups_claim    = "groups"
  token_policies  = ["default", vault_policy.admin.name]

  bound_claims = {
    groups = "/Admin"
  }

  allowed_redirect_uris = [
    "https://vault.d3adb5.net/ui/vault/auth/oidc/oidc/callback",
    "https://vault.d3adb5.net/oidc/oidc/callback"
  ]
}
