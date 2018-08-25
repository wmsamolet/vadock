require 'yaml'
require 'fileutils'

config = {
  local: './vagrant.yml',
  example: './vagrant.example.yml'
}

# Copy config from example if local config not exists
FileUtils.cp config[:example], config[:local] unless File.exist?(config[:local])

# Read config
options = YAML.load_file config[:local]

########################################################################################################################
# Check github token
########################################################################################################################

if options['github_token'].nil? || options['github_token'].to_s.length != 40
	puts "You must place REAL GitHub token into configuration:\n/vagrant.yml"
	exit
end

########################################################################################################################
# Vagrant configurate
########################################################################################################################

Vagrant.configure(2) do |config|

    # select the box
    config.vm.box = "debian/stretch64"

    # Should we ask about box updates?
    config.vm.box_check_update = options['box_check_update']

    config.vm.provider 'virtualbox' do |vb|
        # Machine cpus count
        vb.cpus = options['cpus']

        # Machine memory size
        vb.memory = options['memory']

        # Machine name (for VirtualBox UI)
        vb.name = options['machine_name']

        # Using the host's resolver as a DNS proxy in NAT mode
        vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']

        # Limit max cpu usage of host machine
        vb.customize ['modifyvm', :id, '--cpuexecutioncap', options['cpu_limit']]
    end

    config.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end

    ####################################################################################################################
    # Network settings
    ####################################################################################################################

    config.vm.network :forwarded_port, guest: 3306, host: options['host_mysql_port'], host_ip: '127.0.0.1'
    config.vm.network :private_network, ip: options['ip']

    ####################################################################################################################
    # Hosts settings (host machine)
    ####################################################################################################################

    # Machine name (for vagrant console)
    config.vm.define options['machine_name']

    # Machine name (for guest machine console)
    config.vm.hostname = options['machine_name']

    # Shared folders
    config.vm.synced_folder '.', '/vagrant', disabled: true
    config.vm.synced_folder '.', '/vadock', owner: 'vagrant', group: 'vagrant'
    config.vm.synced_folder options['host_www_path'], '/www', owner: 'vagrant', group: 'vagrant'

    config.vm.provision :hostmanager
    config.hostmanager.enabled            = true
    config.hostmanager.manage_host        = true
    config.hostmanager.manage_guest       = true
    config.hostmanager.ignore_private_ip  = false
    config.hostmanager.include_offline    = true
    config.hostmanager.aliases            = options['domains']

    ####################################################################################################################
    # Provisions
    ####################################################################################################################

    # provision Base Packages
    config.vm.provision "base", type: "shell" do |s|
        s.path = "./vagrant/provision/base.sh"
        s.args = [options['timezone']]
    end

    # Generate Vagrant Putty Private Key
    config.vm.provision "putty", type: "shell" do |s|
        s.path = "./vagrant/provision/generate-keys.sh"
        s.args = [options['machine_name']]
    end

    config.vm.provision "shell", inline: 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf', run: "always"

    # Docker build
    config.vm.provision "shell", path: './vagrant/provision/docker.sh', run: "once"
    config.vm.provision "shell", path: './bin/get-compose', run: "once"
    config.vm.provision "docker_init", type: "shell", run: "always" do |s|
        s.path = "./bin/init"
        s.args = ["", "/vadock"]
    end

    # post-install message (vagrant console)
    config.vm.post_up_message = "VAGRANT START SUCCESSFUL!"
end
