resource "keycloak_group" "this" {
  for_each = toset(var.groups)
  realm_id = keycloak_realm.core.id
  name     = each.key
}
