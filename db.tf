resource "docker_volume" "gitea_db_data" {}

resource "docker_container" "gitea_db" {
  name  = "gitea_postgres"
  image = var.postgres_image
  restart = "always"

  env = [
    "POSTGRES_USER=${var.gitea_db_user}",
    "POSTGRES_PASSWORD=${var.gitea_db_password}",
    "POSTGRES_DB=${var.gitea_db_name}"
  ]

  volumes {
    volume_name    = docker_volume.gitea_db_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.gitea_network.name
  }
}