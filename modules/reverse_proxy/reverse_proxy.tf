resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = var.nginx_image
  restart = "always"

  volumes {
  host_path      = var.nginx_conf_path
  container_path = "/etc/nginx/nginx.conf"
  read_only      = true
}

  volumes {
  host_path      = var.ssl_cert_path
  container_path = "/etc/nginx/certs/selfsigned.crt"
  read_only      = true
}

  volumes {
  host_path      = var.ssl_key_path
  container_path = "/etc/nginx/certs/selfsigned.key"
  read_only      = true
}

  ports {
    internal = var.nginx_port
    external = var.nginx_port
  }

  networks_advanced {
    name = var.network_name
  }
}