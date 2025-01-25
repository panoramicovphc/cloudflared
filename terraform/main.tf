terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "private_network" {
  name     = "mkhouse-vpc-net"
  driver   = "bridge"
  internal = false

  lifecycle {
    ignore_changes = [name]
  }
}

output "network_name" {
  value = docker_network.private_network.name
}
