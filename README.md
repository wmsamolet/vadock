VaDock = Vagrant + Docker
-----------------
Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Install [Vagrant](https://www.vagrantup.com/downloads.html) the last version

Install Vagrant pluging's:
```bash
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
```

Start virtual machine:
```bash
vagrant up

docker-machine create --driver generic --generic-ip-address=10.0.0.2 --generic-ssh-key ./ssh/vagrant --generic-ssh-user vagrant [your-machine_name-from-vagrant.yml]

vagrant reload
```
