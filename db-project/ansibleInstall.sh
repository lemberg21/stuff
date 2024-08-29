#!/bin/bash
echo "Updating system"
sudo apt update  -y
sudo apt upgrade -y
sudo apt-add-repository ppa: ansible/ansible
sudo apt install ansible git -y
ansible --version