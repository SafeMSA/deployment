service {
  name    = "$SERVICE_NAME"
  id      = "$SERVICE_ID"
  address = "$SERVICE_ADDRESS"
  port    = $SERVICE_PORT

  tags = ["v1"]
  meta = {
    version = "1"
  }

  connect {
    sidecar_service {
      port = 20000

      check {
        name     = "Connect Envoy Sidecar"
        tcp      = "$SERVICE_ADDRESS:20000"
        interval = "10s"
      }

      proxy {
        upstreams {
          destination_name   = "$DESTINATION_NAME"
          local_bind_address = "127.0.0.1"
          local_bind_port    = $DESTINATION_PORT

          config {
            connect_timeout_ms = 3000
            limits {
              max_connections         = 5
              max_pending_requests    = 5
              max_concurrent_requests = 5
            }
            passive_health_check {
              interval     = "5s"
              max_failures = 100
            }
          }
        }
      }
    }
  }
}
