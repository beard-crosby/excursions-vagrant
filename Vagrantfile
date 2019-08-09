# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "./docs", "/vagrant_docs"
  config.vm.synced_folder "./sites", "/var/www", :mount_options => ["dmode=777","fmode=777"], :owner => "vagrant", :group => "vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", path: "docs/root-script.sh"
  config.vm.provision "shell", path: "docs/user-script.sh", privileged: false
end
