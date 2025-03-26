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
    }
  }
}
