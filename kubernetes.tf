resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "${var.project_name}-namespace"
  }
}

resource "kubernetes_secret" "keyvault_secrets" {
  metadata {
    name      = "keyvault-secrets"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  data = {
    "db-connection-string" = azurerm_key_vault_secret.db_connection.value
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name      = "spd-app"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "spd-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "spd-app"
        }
      }

      spec {
        container {
          name  = "spd-app-container"
          image = "schwendler/embarque-ti-spd-project"

          env {
            name  = "SPD_KEY_VAULT_URI"
            value = azurerm_key_vault.kv.vault_uri
          }

          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}
