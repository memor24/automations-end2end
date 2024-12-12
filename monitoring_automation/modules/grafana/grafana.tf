
# Resources:

#creating a docker network not needed here
#grafana module is connected to the monitoring network via 04_Monitoring/main.tf
#using variables in the modules

# this is how images are created in kreuzwerker/docker
data "docker_registry_image" "grafana_image" {
  name = "grafana/grafana:latest"
}
resource "docker_image" "grafana_image" {
  name          = data.docker_registry_image.grafana_image.name
  pull_triggers = [data.docker_registry_image.grafana_image.sha256_digest]
}
# created the image seperately to make sure it is also managed by terraform

#create a grafana container
resource "docker_container" "graf_container" {
  name  = "grafana_container"
  image = docker_image.grafana_image.name

  #define ports
  ports {
    internal = 3000
    external = 3000
  }
  #mount volumes
  volumes {
    host_path      = "/var/lib/grafana"
    container_path = "/var/lib/grafana"
  }
  #connect the container to the network
  networks_advanced {
    name = var.network_name
  }
  #container auto restart policy
  restart = "always"
}


# Outputs:
output "grafana_url" {
  value = "http://localhost:3000"
}
