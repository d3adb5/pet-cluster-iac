variable "client_id" {
  description = "Client ID for the Keycloak client used by Terraform."
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Client secret for the Keycloak client used by Terraform."
  type        = string
  sensitive   = true
}

variable "keycloak_url" {
  description = "URL for the Keycloak server."
  type        = string
}

variable "users" {
  description = "Map of users to create in our main realm, indexed by username."

  type = map(object({
    enabled          = optional(bool, true)
    email            = string
    initial_password = optional(string)
    first_name       = optional(string)
    last_name        = optional(string)
  }))
}
