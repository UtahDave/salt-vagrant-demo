# -*- mode: ruby -*-
# vi: set ft=ruby :

MINIONS = {
  :minion_ubuntu14 => {
    :hostname => 'minion-ubuntu14',
    :box => 'ubuntu/trusty64',
    :box_version => '<= 20170512.0.0',
  },
  :minion_ubuntu16 => {
    :hostname => 'minion-ubuntu16',
    :box => 'ubuntu/xenial64',
    :box_version => '<= 20170518.0.0',
  },
  :minion_centos6 => {
    :hostname => 'minion-centos6',
    :box => 'geerlingguy/centos6',
    :box_version => '<= 1.1.6',
  },
  :minion_centos7 => {
    :hostname => 'minion-centos7',
    :box => 'geerlingguy/centos7',
    :box_version => '<= 1.2.0',
  },
}

SALTSTACK_HOME= ENV["SALTSTACK_HOME"] || "saltstack/"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
  end
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    master_config.vm.synced_folder "#{SALTSTACK_HOME}/", "/srv"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      salt.master_key = "saltstack/keys/master_minion.pem"
      salt.master_pub = "saltstack/keys/master_minion.pub"
      salt.minion_key = "saltstack/keys/master_minion.pem"
      salt.minion_pub = "saltstack/keys/master_minion.pub"
      salt.seed_master = {
        "minion-ubuntu14" => "saltstack/keys/minion-ubuntu14.pub",
        "minion-ubuntu16" => "saltstack/keys/minion-ubuntu16.pub",
        "minion-centos6" => "saltstack/keys/minion-centos6.pub",
        "minion-centos7" => "saltstack/keys/minion-centos7.pub",
      }
      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  ip=10
  MINIONS.each do |name, cfg|
    ip += 1
    config.vm.define name, autostart: (name == :minion_ubuntu16) do |minion_config|
      minion_config.vm.hostname = cfg[:hostname]
      minion_config.vm.box = cfg[:box]
      minion_config.vm.box_version = cfg[:box_version]
      minion_config.vm.network "private_network", ip: "192.168.50.#{ip}"

      minion_config.vm.provision :salt do |salt|
        salt.minion_config = "saltstack/etc/#{cfg[:hostname]}"
        salt.minion_key = "saltstack/keys/#{cfg[:hostname]}.pem"
        salt.minion_pub = "saltstack/keys/#{cfg[:hostname]}.pub"
        salt.install_type = "stable"
        salt.verbose = true
        salt.colorize = true
        salt.bootstrap_options = "-P -c /tmp"
      end
    end
  end
end
