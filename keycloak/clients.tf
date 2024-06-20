resource "keycloak_openid_client_scope" "groups" {
  realm_id = keycloak_realm.laboratory.id
  name     = "groups"
}

resource "keycloak_openid_group_membership_protocol_mapper" "groups" {
  realm_id        = keycloak_realm.laboratory.id
  claim_name      = "groups"
  name            = "groups"
  client_scope_id = keycloak_openid_client_scope.groups.id
}

resource "keycloak_openid_client" "argocd" {
  realm_id  = keycloak_realm.laboratory.id
  client_id = "argocd"

  name    = "Argo CD"
  enabled = true

  access_type        = "CONFIDENTIAL"
  use_refresh_tokens = false
  root_url           = "https://argo.d3adb5.net"

  valid_post_logout_redirect_uris = [
    "+",
  ]

  valid_redirect_uris = [
    "https://argo.d3adb5.net/auth/callback",
  ]

  web_origins = [
    "https://argo.d3adb5.net",
  ]
}

resource "keycloak_openid_client_default_scopes" "argocd" {
  realm_id  = keycloak_realm.laboratory.id
  client_id = keycloak_openid_client.argocd.id

  default_scopes = [
    "acr",
    "basic",
    "email",
    "profile",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "argocd" {
  realm_id  = keycloak_realm.laboratory.id
  client_id = keycloak_openid_client.argocd.id

  optional_scopes = [
    "address",
    "microprofile-jwt",
    "offline_access",
    "phone",
  ]
}
