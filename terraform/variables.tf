variable "docker_host" {
  description = "The Docker host"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "vpc_network_name" {
  description = "The name of the Docker network"
  type        = string
  default     = "mkhouse-vpc-net"
}

variable "docker_compose_file" {
  description = "The path to the docker-compose.yml file"
  type        = string
  default     = "../docker/docker-compose.yml"
}
