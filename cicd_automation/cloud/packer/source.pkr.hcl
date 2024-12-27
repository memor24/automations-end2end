// packer image: jenkins docker image+groovy code+jenkinsfile

packer {
    required_plugins {
        docker = {
            version = ">=1.0.8"
            source="github.com/hashicorp/docker"
        }

    }
}

source docker "jenkins" {
    image= "jenkins:lts"
    commit= true # commits a container to the image
}