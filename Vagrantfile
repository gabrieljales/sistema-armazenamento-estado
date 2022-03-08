Vagrant.configure("2") do |config|

  config.vm.box = "debian/buster64"

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8000

  config.vm.network "private_network", ip: "192.168.57.10"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end

  config.vm.provision "shell", inline: <<-SHELL
    timedatectl set-timezone America/Fortaleza
    apt-get update
    apt-get install -y apache2
    echo "Provisioning ended!!"
  SHELL
end
