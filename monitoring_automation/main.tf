terraform {
  required_version = ">= 0.12"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0"
    }
  }
}

# monitoring network on docker(local/compose)
resource "docker_network" "monitoring_network" {
  name   = "Monitoring_Network_Docker"
  driver = "bridge"
}

module "grafana" {
  source       = "./modules/grafana"
  network_name = docker_network.monitoring_network.name
}

module "prometheus" {
  source       = "./modules/prometheus"
  network_name = docker_network.monitoring_network.name
}