resource "docker_container" "watchtower" {
  name   = var.watchtower_name
  image  = var.watchtower_image
  restart = "always"

  command = [
    "--cleanup",
    "--interval", var.watchtower_interval
  ]

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
    read_only      = true
  }

  networks_advanced {
    name = var.network_name
  }
}