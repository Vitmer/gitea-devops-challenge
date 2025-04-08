resource "docker_volume" "gitea_data" {}

resource "docker_container" "gitea" {
  name  = "gitea"
  image = var.gitea_image
  restart = "always"

  env = [
    "USER_UID=1000",
    "USER_GID=1000",
    "GITEA__database__DB_TYPE=postgres",
    "GITEA__database__HOST=gitea_postgres:5432",
    "GITEA__database__NAME=${var.gitea_db_name}",
    "GITEA__database__USER=${var.gitea_db_user}",
    "GITEA__database__PASSWD=${var.gitea_db_password}",
    "GITEA__server__ROOT_URL=https://localhost"
  ]

  ports {
    internal = 3000
    external = 3000
  }

  volumes {
    volume_name    = docker_volume.gitea_data.name
    container_path = "/data"
  }

  networks_advanced {
    name = docker_network.gitea_network.name
  }

  depends_on = [docker_container.gitea_db]
}