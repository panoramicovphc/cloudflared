output "vpc_network_name" {
  description = "The name of the Docker network"
  value       = var.vpc_network_name
}

output "docker_host" {
  description = "The Docker host"
  value       = var.docker_host
}
