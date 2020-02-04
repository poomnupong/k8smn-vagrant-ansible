# Quick Kubernetes multi-node setup with Vagrant and Ansible
_va005-k8smulti-vagrant-ansible_  
2020.02.03

***Disclaimer:***  
Original author of the code used here is publicly available on kubernetes.io blog [Kubernetes Setup Using Ansible and Vagrant](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/). Credits to the original author.
The code includes my minor adjustment to make it work on my setup as the original code throws errors.

## Purpose
This script will bring up multi-node Kubernetes cluster using Vagrant and Ansible. 
Examining the code is also a good way to learn about Vagrant, Ansible, and Kubernetes basic installation.

## Tested environment
- Mac OS 10.15.3 Catalina
- Vagrant 2.2.6
- VirtualBox 6.1.2
- Ansible 2.9.3
- Python 3.8.1

## Some details about the setup
- bento/ubuntu-18.04 base image
- spin up 1 master and 2 worker nodes by default
- use Calico networking

## Usage
Simply start vagrant up and enjoy the show.

    > vagrant up

kubectl is available in k8s-master node. We can ssh into it as soon as the VM is up. Below is output when the cluster came up and stable. On my MacBook Pro this took about 5 minutes.

    > vagrant ssh k8s-master
    Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-72-generic x86_64)
    ...
    vagrant@k8s-master:~$ kubectl get nodes
    NAME         STATUS   ROLES    AGE     VERSION
    k8s-master   Ready    master   9m17s   v1.17.2
    node-1       Ready    <none>   6m32s   v1.17.2
    node-2       Ready    <none>   3m49s   v1.17.2
    vagrant@k8s-master:~$ kubectl get pods --all-namespaces -o wide
    NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE     IP                NODE         NOMINATED NODE   READINESS GATES
    kube-system   calico-kube-controllers-77c4b7448-4dfbl   1/1     Running   0          9m39s   192.168.235.195   k8s-master   <none>           <none>
    kube-system   calico-node-fftcd                         1/1     Running   0          7m14s   192.168.50.11     node-1       <none>           <none>
    kube-system   calico-node-hp29t                         1/1     Running   0          9m39s   192.168.50.10     k8s-master   <none>           <none>
    kube-system   calico-node-w5f9b                         1/1     Running   0          4m32s   192.168.50.12     node-2       <none>           <none>
    kube-system   coredns-6955765f44-kr8tg                  1/1     Running   0          9m39s   192.168.235.193   k8s-master   <none>           <none>
    kube-system   coredns-6955765f44-wshw9                  1/1     Running   0          9m39s   192.168.235.194   k8s-master   <none>           <none>
    kube-system   etcd-k8s-master                           1/1     Running   0          9m56s   192.168.50.10     k8s-master   <none>           <none>
    kube-system   kube-apiserver-k8s-master                 1/1     Running   0          9m56s   192.168.50.10     k8s-master   <none>           <none>
    kube-system   kube-controller-manager-k8s-master        1/1     Running   0          9m56s   192.168.50.10     k8s-master   <none>           <none>
    kube-system   kube-proxy-ctqm5                          1/1     Running   0          7m14s   192.168.50.11     node-1       <none>           <none>
    kube-system   kube-proxy-cvwbw                          1/1     Running   0          4m32s   192.168.50.12     node-2       <none>           <none>
    kube-system   kube-proxy-s28wn                          1/1     Running   0          9m39s   192.168.50.10     k8s-master   <none>           <none>
    kube-system   kube-scheduler-k8s-master                 1/1     Running   0          9m56s   192.168.50.10     k8s-master   <none>           <none>
    vagrant@k8s-master:~$

Then destroy the environment once done.

    > vagrant destroy -f



