resource "vault_policy" "reader" {
  name = "reader"

  policy = <<-EOF
    path "secret/*" {
      capabilities = ["read", "list"]
    }
  EOF
}

resource "vault_policy" "writer" {
  name = "writer"

  policy = <<-EOF
    path "secret/*" {
      capabilities = ["create", "update", "read", "list"]
    }
  EOF
}

resource "vault_policy" "admin" {
  name = "admin"

  policy = <<-EOF
    # Read system health check
    path "sys/health" {
      capabilities = ["read", "sudo"]
    }

    # Create and manage ACL policies broadly across Vault

    # List existing policies
    path "sys/policies/acl" {
      capabilities = ["list"]
    }

    # Create and manage ACL policies
    path "sys/policies/acl/*" {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # Enable and manage authentication methods broadly across Vault

    # Manage auth methods broadly across Vault
    path "auth/*" {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # Create, update, and delete auth methods
    path "sys/auth/*" {
      capabilities = ["create", "update", "delete", "sudo"]
    }

    # List auth methods
    path "sys/auth" {
      capabilities = ["read"]
    }

    # Enable and manage the key/value secrets engine at `secret/` path

    # List, create, update, and delete key/value secrets
    path "kv/*" {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # Manage secrets engines
    path "sys/mounts/*" {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # List existing secrets engines.
    path "sys/mounts" {
      capabilities = ["read"]
    }
  EOF
}
