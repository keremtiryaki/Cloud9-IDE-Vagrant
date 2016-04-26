# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_GROUPS = {
  "ide_group" => ["ide"]
}

Vagrant.configure(2) do |config|

  config.vm.define "ide" do |ide|
    ide.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    ide.vm.box = "ubuntu/trusty64"
    ide.vm.network "private_network", ip: "10.0.0.222"
    ide.vm.hostname = "ide"
    ide.vm.provision "ansible" do |ansible|
      ansible.playbook = "ide.yml"
      ansible.groups = ANSIBLE_GROUPS
      ansible.verbose = "vv"
    end

  end

end
