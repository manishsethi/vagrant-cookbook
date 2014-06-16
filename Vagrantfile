# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Vagrant.require_plugin "vagrant-rackspace"
  config.vm.box = "CentOS"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provider :rackspace do |rs|
    rs.username = ENV['RK_USERNAME']
    rs.api_key  = ENV['RK_API_KEY']
  # rs.flavor   = /1 GB Performance/
    rs.flavor   = "2" #/512 MB Performance/
    rs.image    = /Ubuntu/
    rs.rackspace_region = :hkg
  end
  # if provider == :rackspace
  # config.ssh.private_key_path = "~/.ssh/id_rsa"
  # end

  config.vm.provision :shell, :inline =>  "apt-get update -y"
  config.vm.provision :shell, :inline =>  "apt-get install curl -y"
  config.vm.provision :shell, :inline =>  "curl -L https://www.opscode.com/chef/install.sh | sudo bash"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.add_recipe "apt"
 #   chef.add_recipe "mysql"
 #   chef.add_role "web"
 #   chef.json = { mysql_password: "foo" }
  end
end
