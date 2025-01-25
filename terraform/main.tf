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
  program = ["bash", "-c", "docker network inspect mkhouse-vpc-net >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

resource "null_resource" "create_network" {
  count = data.external.check_network.result.exists == "true" ? 0 : 1

  provisioner "local-exec" {
    command = "docker network create --driver bridge mkhouse-vpc-net"
  }
}

output "network_name" {
  value = "mkhouse-vpc-net"
}
