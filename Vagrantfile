# -*- mode: ruby -*-
# vi: set ft=ruby :

# Adds two hosts
# - db host named db.local using DHCP of IP
# - web host named web.local using DHCP for IP
#
# Both VM's are set to 1024M of RAM
#
# Both VM's use a headless puppet configuration
# Manifest located at manifests/base.pp
#
# VM's forward port 8000 locally to 8001 (web) 
# and 8002 (db)
#

Vagrant.configure("2") do |config|

  config.vm.box = "centos64"
  
  config.vm.provider :vmware_fusion do |v|
    v.gui = true
    v.vmx["memsize"] = "1024"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
  end

  config.vm.define :web do |web_config|
      web_config.vm.hostname = "web.local"
      web_config.vm.network :forwarded_port, guest: 8000, host: 8001
  end

  config.vm.define :db do |db_config|
      db_config.vm.hostname = "db.local"
      db_config.vm.network :forwarded_port, guest: 8000, host: 8002
  end

end
