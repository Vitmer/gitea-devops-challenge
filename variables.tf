variable "gitea_image" {
  type    = string
  default = "gitea/gitea:latest"
}

variable "postgres_image" {
  type    = string
  default = "postgres:15"
}

variable "gitea_db_user" {
  type    = string
  default = "gitea"
}

variable "gitea_db_password" {
  type    = string
  default = "gitea"
}

variable "gitea_db_name" {
  type    = string
  default = "gitea"
}

variable "gitea_container_name" {
  type    = string
  default = "gitea"
}

variable "gitea_http_port" {
  type    = number
  default = 3000
}

variable "gitea_ssh_port" {
  type    = number
  default = 2222
}

variable "gitea_volume_name" {
  type    = string
  default = "gitea_data"
}

variable "gitea_db_container_name" {
  type    = string
  default = "gitea_postgres"
}

variable "network_name" {
  type    = string
  default = "gitea_net"
}

variable "nginx_container_name" {
  type    = string
  default = "nginx_reverse_proxy"
}

variable "nginx_image" {
  type    = string
  default = "nginx:stable"
}

variable "nginx_port" {
  type    = number
  default = 443
}

variable "watchtower_name" {
  type    = string
  default = "watchtower"
}

variable "watchtower_image" {
  type    = string
  default = "containrrr/watchtower"
}

variable "watchtower_interval" {
  type    = string
  default = "30"
}

variable "cadvisor_port" {
  type    = number
  default = 18080
}

variable "fluentbit_name" {
  type    = string
  default = "fluent-bit"
}

variable "fluentbit_image" {
  type    = string
  default = "fluent/fluent-bit:latest"
}

variable "fluentbit_port" {
  type    = number
  default = 2020
}

variable "cadvisor_name" {
  type    = string
  default = "cadvisor"
}

variable "cadvisor_image" {
  type    = string
  default = "gcr.io/cadvisor/cadvisor:latest"
}

variable "prometheus_name" {
  type    = string
  default = "prometheus"
}

variable "prometheus_image" {
  type    = string
  default = "prom/prometheus:latest"
}

variable "prometheus_port" {
  type    = number
  default = 9090
}