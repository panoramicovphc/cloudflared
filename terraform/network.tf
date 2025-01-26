resource "docker_network" "mkhouse_vpc_net" {
  name   = var.network_name
  driver = "bridge"
}
