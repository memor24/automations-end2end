// vbox linux ubuntu server as jenkins master
// tbu
terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.1"
    }
  }
}

resource "virtualbox_vm" "new_vboxvm" {
  name      = "jenkins_server"
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}

output "vm_ip" {
  value = element(virtualbox_vm.newvbox_vm.*.network_adapter.0.ipv4_address, 1)
}