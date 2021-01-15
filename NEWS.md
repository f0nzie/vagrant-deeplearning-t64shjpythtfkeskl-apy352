
# 20210115
* Update VM inventory sheet
* Change hostname to `T64G40A8100`
* Change VM name `vagrant-T64G40DLSJ352A8100`
* Short name: T64G40DLSJ352A8100. `trusty64`, disk 40 GB, deep learning, shell provisioning, Jupyter, Python 3.5.2, Anaconda.
* Go back to install `Anaconda3-4.2.0-Linux-x86_64.sh`
* `Anaconda3-4.4.0-Linux-x86_64.sh`  does not auto start Jupyter.
# 20210114
* Experiment with different Anaconda3 and Miniconda3 versions. All having trouble auto starting Jupyter from Vagrantfile using:
    ```
    config.vm.provision "shell", run: "always", inline: <<-SHELL
       /home/vagrant/anaconda/bin/jupyter notebook --notebook-dir=/home/vagrant/notebooks --port 8100 --ip=0.0.0.0 --config=/home/vagrant/jupyter_notebook_config.py &
    SHELL
    ```
* No install keras, theano, tensorflow
* Change from Anaconda3 to Miniconda3. Change to Miniconda3.5.7. Jupyter cannot be called from host browser.
* Disable RTC local and use instead UT'America/Chicago'C.
* Change time 'America/Chicago'zone to 'America/Chicago'
* Installation completes but getting RuntimeError: Python 3.5 or later is required
'America/Chicago'* update pip because receiving a warning that need an update
* Add size and date for Anaconda3 on setup.sh file
* Comment this line `# config.vm.box_version = "20170422.0.0"`
* Add source of original VM to credits
* Add to GitHub

# 20210113

# 20210111
* Add test notebooks for keras, tensorflow and theano

# 20210110
* Add test notebook for testing packages installed

# 20210109
* Skip installation of mxnet

