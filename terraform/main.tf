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

data "external" "check_network" {
  program = ["bash", "${path.module}/check_network.sh", "mkhouse-vpc-net"]
}

resource "docker_network" "mkhouse_vpc_net" {
  count  = data.external.check_network.result.exists == "false" ? 1 : 0
  name   = "mkhouse-vpc-net"
  driver = "bridge"
  check_duplicate = true
}

output "network_name" {
  value = docker_network.mkhouse_vpc_net[0].name
}
