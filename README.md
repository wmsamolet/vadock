VaDock = Vagrant + Docker
-----------------

# Installation (vagrant)

#### Step 1: Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

#### Step 2: Install [Vagrant](https://www.vagrantup.com/downloads.html) the last version

#### Step 3: Install Vagrant pluging's:
```bash
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
```

#### Step 4: Customize config's in /you/project/dir/config/YOU_PROJECT_NAME/vagrant.yml

#### Step 5: Start virtual machine:
```bash
vagrant up
vagrant ssh
```

# Installation (docker)

#### Step 1: Clone this repository:

```bash
git clone https://github.com/wmsamolet/vadock.git /you/project/dir/
```

#### Step 2: Create project config from default

```bash
cd /you/project/dir/
./bin/project create YOU_PROJECT_NAME
```

#### Step 3: Customize config's in /you/project/dir/config/YOU_PROJECT_NAME/*

#### Step 4: Init project 
```bash
./bin/project init YOU_PROJECT_NAME
```
