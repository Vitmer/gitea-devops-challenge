resource "docker_container" "cadvisor" {
  name  = var.cadvisor_name
  image = var.cadvisor_image
  restart = "always"

  ports {
    internal = 8080
    external = var.cadvisor_port
  }

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }

  volumes {
    host_path      = "/var/run"
    container_path = "/var/run"
  }

  volumes {
    host_path      = "/sys"
    container_path = "/sys"
    read_only      = true
  }

  volumes {
    host_path      = "/var/lib/docker"
    container_path = "/var/lib/docker"
    read_only      = true
  }

  networks_advanced {
    name = var.network_name
  }
}