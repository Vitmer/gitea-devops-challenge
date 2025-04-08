resource "docker_container" "prometheus" {
  name  = var.prometheus_name
  image = var.prometheus_image
  restart = "always"

  ports {
    internal = 9090
    external = var.prometheus_port
  }

  volumes {
    host_path      = var.prometheus_path
    container_path = "/etc/prometheus/prometheus.yml"
    read_only      = true
  }

  networks_advanced {
    name = var.network_name
  }
}