# -*- mode: ruby -*-
# vi: set ft=ruby :

NODENAME = "testme"
KUBECTL_PORT = 6443

Vagrant.configure("2") do |config|

  config.vm.define NODENAME do |machine|
      machine.vm.hostname = NODENAME
      machine.vm.box = "geerlingguy/centos7"
      #machine.vm.box = "geerlingguy/ubuntu2004"
      machine.vm.box_check_update = false
      
      machine.vm.provider "virtualbox" do |vb|
        # be faster
        vb.linked_clone = true
        vb.memory = 2048
        vb.cpus = 2
      end
      
      machine.vm.provision :ansible do |ansible|
        ansible.playbook = 'setup-buildah.yml'

        ansible.become = true
        ansible.verbose = "v"
        ansible.raw_arguments = ['--diff']

        if ENV['ANSIBLE_TAGS'] then ansible.tags = ENV['ANSIBLE_TAGS']; end

        ansible.groups = {
            "vagrant" => [ NODENAME ],
        }
        ansible.extra_vars = {
            ansible_python_interpreter: 'python2', # or python3
        }
      end



  end

  # config.vm.network "forwarded_port", guest: 80, machine: 8080


  # config.vm.synced_folder "../data", "/vagrant_data"

end
