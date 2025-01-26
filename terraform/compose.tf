resource "null_resource" "docker_compose_pull" {
  provisioner "local-exec" {
    command = "docker compose -f ${var.docker_compose_file} pull"
  }
  depends_on = [docker_network.mkhouse_vpc_net]
}

resource "null_resource" "docker_compose_up" {
  provisioner "local-exec" {
    command = "docker compose -f ${var.docker_compose_file} up -d --force-recreate --remove-orphans --build"
  }
  depends_on = [null_resource.docker_compose_pull]
}

resource "null_resource" "docker_image_prune" {
  provisioner "local-exec" {
    command = "docker image prune --force"
  }
  depends_on = [null_resource.docker_compose_up]
}
