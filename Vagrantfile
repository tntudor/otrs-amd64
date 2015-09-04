# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  config.vm.box = "ubuntu-14.04-puppet-v.0.1.0"
#  config.vm.provider "virtualbox" do |v|
#    v.memory = 1024
#    v.cpus = 2
#  end
#  config.vm.hostname = "otrs.tudor.local"
#  config.vm.network "forwarded_port", guest: 80, host: 3002, protocol: 'tcp', host_ip: "127.0.0.1"
  
#  TODO: provisioning - puppet
#        apache, perl + CPAN, mysql/mariadb
#        otrs + itsm
#  config.vm.provision "shell",
#    path: "init.sh"

#  config.vm.provision "file",
#    source: 'Config.pm',
#    destination: "Config.pm"

#  config.vm.provision "shell",
#    path: "db.sh"

#  config.vm.post_up_message = "The OTRS installer is available at http://otrs.tudor.local:3002/otrs/installer.pl"

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu-14.04-puppet-v.0.1.0"
    web.vm.
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu-14.04-puppet-v.0.1.0"
  end

end
