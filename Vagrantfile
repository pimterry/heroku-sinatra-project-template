# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'heroku'
  config.vm.box_url = 'https://dl.dropboxusercontent.com/s/rnc0p8zl91borei/heroku.box'

  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 7474, host: 7474

  config.vm.provision :shell, :path => 'puppet/install_librarian.sh'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.manifest_file  = 'init.pp'
  end
end