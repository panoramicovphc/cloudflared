data "external" "check_vpc_network" {
  program = ["bash", "-c", "docker network inspect ${var.vpc_network_name} >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

resource "null_resource" "create_network" {
  count = data.external.check_vpc_network.result.exists == "true" ? 0 : 1

  provisioner "local-exec" {
    command = "docker network create --driver bridge ${var.vpc_network_name}"
  }
}
