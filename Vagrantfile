Vagrant.configure('2') do |config|
  config.vm.box         = "ubuntu/trusty64"
  config.vm.hostname    = "t64dljpythtfke"
  # config.vm.box_version = "20170422.0.0"

  config.vm.provider "virtualbox" do |v|
    v.cpus   = 2
    v.memory = 4096
    # Explicitly setting the name, otherwise the default looks like : 
    v.name   = "vagrant-t64dljpythtfkeskl"
  end

  config.vm.provision "file", source: "requirements.txt", destination: "/home/vagrant/requirements.txt"
  config.vm.provision :shell, path: 'setup.sh', keep_color: true
  config.vm.provision "file", source: "jupyter_application_config.py", destination: "/home/vagrant/jupyter_notebook_config.py"

  config.vm.synced_folder "notebooks/", "/home/vagrant/notebooks"

  config.vm.network "forwarded_port", guest: 8100, host: 8100, auto_correct: true
  config.vm.network "forwarded_port", guest: 6006, host: 6006, auto_correct: true

  # Jupyter autorun works. Conda install
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    /home/vagrant/anaconda/bin/jupyter notebook --notebook-dir=/home/vagrant/notebooks --port 8100 --ip=0.0.0.0 --config=/home/vagrant/jupyter_notebook_config.py &
  SHELL

end

