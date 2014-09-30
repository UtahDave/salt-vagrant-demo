# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    #master_config.vm.box = "chef/centos-6.5"
    master_config.vm.box = "hashicorp/precise64"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    #master_config.vm.network :hostonly, "172.16.42.10"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      salt.install_type = "git"
      salt.install_args = '2014.7'
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
    end
  end

  config.vm.define :minion1 do |minion_config|
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.box = "hashicorp/precise64"
    minion_config.vm.host_name = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.11"
    #minion_config.vm.network :hostonly, '172.16.42.11'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion1"
      salt.install_type = "git"
      salt.install_args = '2014.7'
      salt.verbose = true
    end
  end

  config.vm.define :minion2 do |minion_config|
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.box = "hashicorp/precise64"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.50.12"
    #minion_config.vm.network :hostonly, '172.16.42.12'

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion2"
      salt.install_type = "git"
      salt.install_args = '2014.7'
      salt.verbose = true
    end
  end

end
