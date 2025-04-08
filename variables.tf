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

variable "cadvisor_host_port" {
  type    = number
  default = 18080
}