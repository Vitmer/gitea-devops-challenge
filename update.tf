resource "docker_container" "watchtower" {
  name  = "watchtower"
  image = "containrrr/watchtower"
  restart = "always"

  command = [
    "--cleanup", "--interval", "300", "gitea", "gitea_postgres"
  ]

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  networks_advanced {
    name = docker_network.gitea_network.name
  }
}