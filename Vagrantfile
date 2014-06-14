
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu-official"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "private_network", ip: "192.168.34.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "496"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = File.expand_path("..", __FILE__)
    puppet.manifest_file  = "bootstrap.pp"
  end

  config.vm.provision "shell", id: "update", inline: "apt-get update && apt-get -y upgrade"
  config.vm.provision "shell", id: "provision", path: "#{File.expand_path("..", __FILE__)}/provisions.sh"

end
