# Resources:

#creating docker network not needed here
#prometheus module is connected to monitoring network via 04_Monitoring/main.tf
#using variables in the modules

# this is how images are created in kreuzwerker/docker
data "docker_registry_image" "prometh_image" {
  name = "prom/prometheus:latest"
}
resource "docker_image" "prometh_image" {
  name          = data.docker_registry_image.prometh_image.name
  pull_triggers = [data.docker_registry_image.prometh_image.sha256_digest]
}
# creating the image seperately to make sure it is also managed by terraform

#creating prometheus container
resource "docker_container" "prometh_container" {
  name  = "prometheus_container"
  image = docker_image.prometh_image.name

  #port binding
  ports {
    internal = 9090
    external = 9090
  }
  #container volume for persistent prometheus data
  volumes {
    host_path      = "/etc/prometheus/prometheus.yml"
    container_path = "/etc/prometheus"
  }
  #attaching container to network
  networks_advanced {
    name = var.network_name
  }
  restart = "always"
}


# Outputs:
output "prometheus_url" {
  value = "http://localhost:9090/metrics"
}
