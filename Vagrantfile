# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_GROUPS = {
  "ide_group" => ["ide"]
}

COPY_USER_SETTINGS_COMMAND = "cp /root/.c9/user.settings /vagrant/roles/cloud9/templates/c9.user.settings.j2"
START_C9 = "/usr/bin/forever start /home/vagrant/Cloud9IDE/server.js -p 8181 -l 0.0.0.0 -a : -w '/vagrant/workspace'"

Vagrant.configure(2) do |config|

  config.vm.define "ide" do |ide|
    ide.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    ide.vm.box = "ubuntu/trusty64"
    ide.vm.network "private_network", ip: "10.0.0.222"
    ide.vm.hostname = "ide"
    ide.vm.provision "ansible" do |ansible|
      ansible.playbook = "ide.yml"
      ansible.groups = ANSIBLE_GROUPS
      ansible.verbose = "vv"
    end
    ide.vm.provision "shell", inline: START_C9, run: "always"


    ide.trigger.before :halt do
      run_remote COPY_USER_SETTINGS_COMMAND
    end

    ide.trigger.before :destroy do
      run_remote COPY_USER_SETTINGS_COMMAND
    end

    ide.trigger.before :suspend do
      run_remote COPY_USER_SETTINGS_COMMAND
    end

  end

end
