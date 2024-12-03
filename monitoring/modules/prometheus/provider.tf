terraform {
  required_version = "> 0.12"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0"
    }
  }
}

# configuring the docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# provided and configured with the yaml
# instead of using prometheus module on doecker or kubernetes: 
