
hosts = [
    {
      :name => "ignite1",
      :eth1 => "192.168.56.10",
      :mem => "2048",
      :cpu => "2",
    },
    {
      :name => "ignite2",
      :eth1 => "192.168.56.11",
      :mem => "2048",
      :cpu => "2",
    },
    {
      :name => "ignite3",
      :eth1 => "192.168.56.12",
      :mem => "2048",
      :cpu => "2",
    },
  ]
  

  
  # All Vagrant configuration is done below. The "2" in Vagrant.configure
  # configures the configuration version (we support older styles for
  # backwards compatibility). Please don't change it unless you know what
  # you're doing.
  Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.provider "virtualbox" do |vb|
      #vb.memory = 2048
      #vb.cpus = 2
      vb.customize ["storageattach", :id,
                    "--storagectl", "IDE",
                    "--port", "0", "--device", "1",
                    "--type", "dvddrive",
                    "--medium", "emptydrive"]
    end
  
   
    hosts.each do |opts|
      config.vm.define opts[:name] do |config|
        config.vm.hostname = opts[:name]
        config.vm.synced_folder ".", "/vagrant", type: "rsync"
  
        # config.vm.provision "ansible" do |ansible|
        #   ansible.inventory_path = "./hosts"
        #   ansible.playbook = "./ignite.yml" 
        # end
  
        #config.vm.network "forwarded_port", guest: 6379, host: opts[:hostport]
  
        config.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id, "--name", opts[:name]]
          v.customize ["modifyvm", :id, "--memory", opts[:mem]]
          v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
        end
  
        # config.vm.provision :shell, path: "bootstrap.sh", run: "once"
        # config.vm.provision :shell, path: "vttablet.sh", run: "once"
  
        config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        config.vm.provision "shell", inline: <<-SHELL
              cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
            SHELL
  
        config.vm.network :private_network, ip: opts[:eth1]
      end
    end
  end