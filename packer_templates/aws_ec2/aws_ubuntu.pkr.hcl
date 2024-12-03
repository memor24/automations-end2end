packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.3"
      source  = "github.com/hashicorp/amazon"
    }
    vagrant = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

# using amazon-ebs (elastic block storage) as template image
source "amazon-ebs" "ubuntu" {
  ami_name      = "test-packer-linux-aws"
  source_ami = "0557a15b87f89cf"
  instance_type = "t2.micro"
 region        = "us-west-2"
  ssh_username = "ubuntu"
}

# image builder
build {
  name = "test-packer-builder"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo ufw allow proto tcp from any to any port 22,80,443",
      "echo 'y' | sudo ufw enable"
    ]
  }
  provisioner "shell" {
    inline = ["echo your configured image is created and ready to be deployed"]
  }

  # turn into a vagrant box e.g. for dev environment
  post-processor "vagrant" {}
}