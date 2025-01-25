  terraform {
    required_providers {
      docker = {
        source  = "kreuzwerker/docker"
        version = "~> 2.0"
      }
    }
  }

  resource "null_resource" "ensure_docker" {
    provisioner "local-exec" {
      command = <<EOT
        sudo systemctl start docker
        sudo systemctl enable docker
      EOT
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
