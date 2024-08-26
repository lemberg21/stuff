# NAME
__SDCA__ - Small Database Cluster Automation  is automation for deploy simple cluster of database service
## SYNOPSIS
Common usage:
For perform different tests with database queris, etc.
### REQUIREMENTS
- [x] Installed Ubuntu 24.04 on the  Winodws Vitualbox APP
- [x] Installed MobaXterm via installed Ansible on it
- [x] Generate ssh keys via Putty and sent public key to vm.
#### RUN DEVELOPMENT VERSION
1. git clone  https://github.com/lemberg21/stuff.git to ansible host
2. ansible-playbook main.yaml

##### In background
Ansible playbook poerform  the following tasks:
- Set hostname
- Set timezone
- Create tech user
- Install and configure docker-compose and all the dependencies
- Install and configure firewall on  VM
- Allow 22, 80,443 ports
- Clone docker-compose.yaml file with nested configuration files
- Run docker-compose.yaml for build

###### 
Thanks for comments
