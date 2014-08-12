# -*- mode: ruby -*-
# vi: set ft=ruby :

# Global variable declaration
VAGRANTFILE_API_VERSION = "2"
ubuntu_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
centos_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

# Create vagrant config
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "opscode-ubuntu-12.04"
    ubuntu.vm.box_url = ubuntu_url
    ubuntu.vm.hostname = "ubuntu1204"
    ubuntu.omnibus.chef_version = :latest

    config.vm.provision :chef_client do |chef|
      chef.provisioning_path = "/etc/chef"
      chef.chef_server_url = "https://api.opscode.com/organizations/madacs-home"
      chef.validation_key_path = ".chef/madacs-home-validator.pem"
      chef.validation_client_name = "madacs-home-validator"
      chef.node_name = "ubuntu1204"
      chef.add_role "base"

    end

  end

  chef = nil

  config.vm.define "centos" do |centos|
    centos.vm.box = "opscode-centos-6.5"
    centos.vm.box_url = centos_url
    centos.vm.hostname = "centos"
    centos.omnibus.chef_version = :latest
    
    config.vm.provision :chef_client do |chef|
      chef.node_name = "centos6dot5"
      chef.provisioning_path = "/etc/chef"
      chef.chef_server_url = "https://api.opscode.com/organizations/madacs-home"
      chef.validation_key_path = ".chef/madacs-home-validator.pem"
      chef.validation_client_name = "madacs-home-validator"
      chef.add_role "base"
    end

  end

end