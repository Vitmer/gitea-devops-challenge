variable "nginx_container_name" {
  type = string
}

variable "nginx_image" {
  type = string
}

variable "nginx_port" {
  type = number
}

variable "nginx_conf_path" {
  type = string
}

variable "ssl_cert_path" {
  type = string
}

variable "ssl_key_path" {
  type = string
}

variable "network_name" {
  type = string
}