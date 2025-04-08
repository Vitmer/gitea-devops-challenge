resource "docker_container" "fluentbit" {
  name  = var.fluentbit_name
  image = var.fluentbit_image
  restart = "always"

  ports {
    internal = 2020
    external = var.fluentbit_port
  }

  volumes {
    host_path      = abspath("${path.module}/fluent-bit.conf")
    container_path = "/fluent-bit/etc/fluent-bit.conf"
    read_only      = true
  }

  networks_advanced {
    name = var.network_name
  }
}