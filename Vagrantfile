# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Ubuntu 14.04.2 LTS (Trusty Tahr) 64-bit
  config.vm.box  = "ubuntu/trusty64"

  # Name this machine
  config.vm.define :mc_rails_workspace

  # Provision this box
  Dir['./provision_scripts/*.sh'].each do |script|
    privileged = script.match(/-su-/) ? true : false
    config.vm.provision :shell, path: script, privileged: privileged
  end

  # Forward the vagrant machine's port (guest) to your machine (host)
  config.vm.network :forwarded_port, guest: 3000, host: 4567
end
