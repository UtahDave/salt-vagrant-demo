# -*- mode: ruby -*-
# vi: set ft=ruby:
Vagrant.configure("2") do |config|
  net_ip = "192.168.50"
  os = "ubuntu/xenial64"
  [
    ["master",     "#{net_ip}.10",    "1024",    os ],
    ["minion1",    "#{net_ip}.11",    "1024",    os ],
    ["minion2",    "#{net_ip}.12",    "1024",    os ],
  ].each do |vmname,ip,mem,box|
    config.vm.define "#{vmname}" do |salt_config|
      salt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "#{mem}"
        vb.cpus = 1
        vb.name = "#{vmname}"
      end
      salt_config.vm.box = "#{box}"
      salt_config.vm.hostname ="#{vmname}"
      salt_config.vm.network "private_network", ip: "#{ip}"
      if "#{vmname}" == "master"
        config.vm.define :master do |master_config|
          master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
          master_config vm.synced_folder "saltstack/pillar/", "/srv/pillar"
        end
      end
      config.vm.provision :salt do |salt|
        if "#{vmname}" == "master"
            salt.master_config = "saltstack/etc/master"
            salt.master_key = "saltstack/keys/master_minion.pem"
            salt.master_pub = "saltstack/keys/master_minion.pub"
            salt.minion_key = "saltstack/keys/master_minion.pem"
            salt.minion_pub = "saltstack/keys/master_minion.pub"
            salt.seed_master = {
                                "minion1" => "saltstack/keys/minion1.pub",
                                "minion2" => "saltstack/keys/minion2.pub"
                               }
            salt.install_master = true
            salt.no_minion = true
          else
            salt.minion_config = "saltstack/etc/#{vmname}"
            salt.minion_key = "saltstack/keys/#{vmname}.pem"
            salt.minion_pub = "saltstack/keys/#{vmname}.pub"
          end
          salt.install_type = "stable"
          salt.verbose = true
          salt.log_level = "debug"
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp"
        end
      end
    end
end
