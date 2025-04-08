variable "gitea_volume_name" {
  type = string
}

variable "gitea_container_name" {
  type = string
}

variable "gitea_image" {
  type = string
}

variable "gitea_http_port" {
  type = number
}

variable "gitea_ssh_port" {
  type = number
}

variable "gitea_db_container_name" {
  type = string
}

variable "gitea_db_name" {
  type = string
}

variable "gitea_db_user" {
  type = string
}

variable "gitea_db_password" {
  type = string
}

variable "network_name" {
  type = string
}