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
vagrant up --provider virtualbox
docker-machine create --driver generic --generic-ip-address=10.0.0.2 --generic-ssh-key ./vagrant/ssh/vagrant --generic-ssh-user vagrant bogacho
```

Vagrant commands:
```bash
vagrant halt
vagrant reload
vagrant destroy
vagrant ssh
```

For enter in docker container inside Vagrant use:
```bash
docker exec -it <container-name> bash
```
