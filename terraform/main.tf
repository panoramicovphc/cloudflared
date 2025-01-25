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

resource "docker_network" "mkhouse_vpc_net" {
  name   = "mkhouse-vpc-net"
  driver = "bridge"
}

output "network_name" {
  value = docker_network.mkhouse_vpc_net.name
}
