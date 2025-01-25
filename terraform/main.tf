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
      if command -v yum &> /dev/null; then
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        sudo yum install -y docker-ce docker-ce-cli containerd.io
      elif command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y docker.io
      fi
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
