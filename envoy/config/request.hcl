# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

service {
  name    = "$SERVICE_NAME"
  id      = "$SERVICE_ID"
  address = "$SERVICE_ADDRESS"
  port    = 9091

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
          destination_name   = "evac"
          local_bind_address = "127.0.0.1"
          local_bind_port    = 9092

          config {
            connect_timeout_ms = 1000
            limits {
              max_connections         = 3
              max_pending_requests    = 4
              max_concurrent_requests = 5
            }
            passive_health_check {
              interval     = "30s"
              max_failures = 10
            }
          }
        }
      }
    }
  }
}
