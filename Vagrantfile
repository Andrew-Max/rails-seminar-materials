VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # This instructs Vagrant to grab the base box from the "Atlas" service that's hosting it for us.
  config.vm.box = "WillEngler/handy"

  # This makes sure that when the Rails server serves a webpage on the VM, it will get passed on to the host.
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Run provisioning script that will insert default config YAML files
  config.vm.provision "shell", path: "./bin/provision"

  config.vm.provider "virtualbox" do |v|
      # These lines solve connection issues Ubuntu VMs run into sometimes.
      # It doesn't hurt to have them, and they'll probably spare you some frustration.
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

      # These are the lines you'll most likely tweak.
      # For good performance, it's a nice rule of thumb to give your Rails VM half of your RAM and all of your CPUS.
      # This does *not* mean that the VM will hog 4 gigs of RAM and two cores all of the time.
      # It just means that they *can* use those resources if push comes to shove.
      v.memory = 4096
      v.cpus = 2
  end

end

