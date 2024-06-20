resource "keycloak_realm" "laboratory" {
  realm   = "laboratory"
  enabled = true

  display_name      = "Laboratory"
  display_name_html = "<strong>Laboratory</strong>"

  login_theme = "keycloak"

  default_signature_algorithm = "RS256"
}

resource "keycloak_user" "users" {
  for_each = var.users

  realm_id = keycloak_realm.laboratory.id
  username = each.key
  enabled  = each.value.enabled

  # TODO: When emails have been set up, remove this line.
  email_verified = true

  email      = each.value.email
  first_name = each.value.first_name
  last_name  = each.value.last_name

  dynamic "initial_password" {
    for_each = toset(compact([each.value.initial_password]))
    content {
      temporary = true
      value     = initial_password.value
    }
  }
}
