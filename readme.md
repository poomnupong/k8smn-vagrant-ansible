# Quick Kubernetes multi-node setup with Vagrant and Ansible
_va005-k8smulti-vagrant-ansible_  
2020.02.03

***Disclaimer:***  
Original author of the code used here is publicly available on kubernetes.io blog [Kubernetes Setup Using Ansible and Vagrant](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/). Credits to the original author.
The code includes my minor adjustment to make it work on my setup as the original code throws errors.

## Purpose
This script will bring up multi-node Kubernetes cluster using Vagrant and Ansible. The script default to 1 master and 3 worker nodes.  
Also, examining the code is a good way to learn about Vagrant, Ansible, and Kubernetes basic installation.

## Tested environment
- Mac OS 10.15.3 Catalina
- Vagrant 2.2.6
- VirtualBox 6.1.2
- Ansible 2.9.3
- Python 3.8.1

## Some details about the setup
- bento/ubuntu-16.04 base image
- use Calico

## Usage
Simply start vagrant up and enjoy the show.

    # vagrant up




