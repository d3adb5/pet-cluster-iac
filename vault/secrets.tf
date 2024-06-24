resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  description = "Convenient key-value secret storage (kv v2)"

  options = {
    version = "2"
  }
}
