#!/bin/bash
echo "Updating system"
sudo apt update  -y
sudo apt upgrade -y
sudo apt-add-repository ppa: ansible/ansible
sudo apt install ansible git -y
ansible --version
sudo mkdir /etc/ansible
ansible-config init --disabled > /etc/ansible/ansible.cfg
echo"ansible_python_interpreter: /bin/python3">>ansible.cfg/