resource "docker_container" "nginx" {
  name  = "nginx_reverse_proxy"
  image = "nginx:stable"
  restart = "always"

  volumes {
    host_path      = abspath("${path.module}/nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
    read_only      = true
  }

  volumes {
    host_path      = abspath("${path.module}/certs")
    container_path = "/etc/nginx/certs"
    read_only      = true
  }

  ports {
    internal = 443
    external = 443
  }

  networks_advanced {
    name = docker_network.gitea_network.name
  }

  depends_on = [docker_container.gitea]
}