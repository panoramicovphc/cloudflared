data "external" "check_network" {
  program = ["bash", "-c", "docker network inspect ${var.network_name} >/dev/null 2>&1 && echo '{\"exists\": \"true\"}' || echo '{\"exists\": \"false\"}'"]
}

resource "null_resource" "create_network" {
  count = data.external.check_network.result.exists == "true" ? 0 : 1

  provisioner "local-exec" {
    command = "docker network create --driver bridge ${var.network_name}"
  }
}
