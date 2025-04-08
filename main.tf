terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "gitea_network" {
  name = "gitea_net"
}

module "db" {
  source  = "./modules/db"

  gitea_db_name     = var.gitea_db_name
  postgres_image    = var.postgres_image
  gitea_db_user     = var.gitea_db_user
  gitea_db_password = var.gitea_db_password
  network_name      = var.network_name
}

module "gitea" {
  source  = "./modules/gitea"

  gitea_container_name    = var.gitea_container_name
  gitea_image             = var.gitea_image
  gitea_http_port         = var.gitea_http_port
  gitea_ssh_port          = var.gitea_ssh_port
  gitea_volume_name       = var.gitea_volume_name
  gitea_db_container_name = var.gitea_db_container_name
  gitea_db_name           = var.gitea_db_name
  gitea_db_user           = var.gitea_db_user
  gitea_db_password       = var.gitea_db_password
  network_name            = var.network_name
}

module "reverse_proxy" {
  source                 = "./modules/reverse_proxy"
  nginx_container_name   = var.nginx_container_name
  nginx_image            = var.nginx_image
  nginx_port             = var.nginx_port

  nginx_conf_path        = abspath("${path.module}/modules/reverse_proxy/nginx.conf")
  ssl_cert_path          = abspath("${path.module}/modules/reverse_proxy/certs/selfsigned.crt")
  ssl_key_path           = abspath("${path.module}/modules/reverse_proxy/certs/selfsigned.key")

  network_name           = var.network_name
}

module "update" {
  source  = "./modules/update"

  watchtower_name     = var.watchtower_name
  watchtower_image    = var.watchtower_image
  watchtower_interval = var.watchtower_interval
  network_name        = var.network_name
}

module "fluentbit" {
  source           = "./modules/fluentbit"
  fluentbit_name   = var.fluentbit_name
  fluentbit_image  = var.fluentbit_image
  fluentbit_port   = var.fluentbit_port
  network_name     = var.network_name
}

module "monitoring" {
  source           = "./modules/monitoring"
  cadvisor_name    = var.cadvisor_name
  cadvisor_image   = var.cadvisor_image
  cadvisor_port    = var.cadvisor_port
  network_name     = var.network_name
}

module "prometheus" {
  source          = "./modules/prometheus"
  prometheus_name = var.prometheus_name
  prometheus_image = var.prometheus_image
  prometheus_port = var.prometheus_port
  network_name    = var.network_name

  prometheus_path        = abspath("${path.module}/modules/prometheus/prometheus.yml")
}