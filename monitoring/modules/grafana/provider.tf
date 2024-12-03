##provider:

terraform {
  required_version = ">= 0.12"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0"

    }
    grafana = {
      source = "grafana/grafana"
    }
  }
}
#configuring the docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
