resource "docker_volume" "gitea_data" {
  name = var.gitea_volume_name
}

resource "docker_container" "gitea" {
  name  = var.gitea_container_name
  image = var.gitea_image

  ports {
    internal = 3000
    external = var.gitea_http_port
  }

  ports {
    internal = 22
    external = var.gitea_ssh_port
  }

  env = [
    "USER_UID=1000",
    "USER_GID=1000",
    "GITEA__database__DB_TYPE=postgres",
    "GITEA__database__HOST=${var.gitea_db_container_name}:5432",
    "GITEA__database__NAME=${var.gitea_db_name}",
    "GITEA__database__USER=${var.gitea_db_user}",
    "GITEA__database__PASSWD=${var.gitea_db_password}",
  ]

  volumes {
    volume_name    = docker_volume.gitea_data.name
    container_path = "/data"
  }

  networks_advanced {
    name = var.network_name
  }

  restart = "always"
}