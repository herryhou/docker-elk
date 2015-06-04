# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # elk demo boxes
  num_nodes = (ENV['NODES_NO'] || 1).to_i
  #base_ip = "10.1.1."

  num_nodes.times do |n|
    config.vm.define "elk-#{n+1}" do |elk|
      elk.vm.box = "debian/jessie64"

      #ip = "base_ip.#{n+100}"
      elk.vm.network :private_network, ip: "10.1.2.#{n+100}"
      elk.vm.network "forwarded_port", guest: 8080, host: n+8080
      elk.vm.network "forwarded_port", guest: 9200, host: n+9200
      elk_index = n+1
      elk.vm.hostname = "elk-#{elk_index}"
      elk.ssh.password = "vagrant"
      elk.vm.provision :shell, :path => "install_docker.sh"
      elk.vm.provision :shell, :path => "cleanup.sh"
      elk.vm.provision :shell, :inline => "cd /vagrant && docker-compose up -d"
    end
  end
end





