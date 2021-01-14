#!/bin/bash

################################################
# Provisions the Deep Learning Virtual Machine 
# 
# Credits :
# Original vm: https://github.com/nirmalyaghosh/deep-learning-vm
# http://ermaker.github.io/blog/2015/09/08/get-started-with-keras-for-beginners.html
# https://github.com/ericwooley/apt-fast-vagrant-install (for apt-fast)
# https://gist.github.com/malev/2d2d76b1662e13acbbca (for miniconda)
# https://gist.github.com/davemkirk/90140b1edde8d18c8b83 (for IPython notebooks)
# Anaconda installers: https://repo.anaconda.com/archive/
################################################

function mssg {
    now=$(date +"%T")
    echo "[$now] $1"
    shift
}

mssg "Provisioning the Deep Learning Virtual Machine ..."

mssg "Updating the package index files. Usually takes ~ 6 minutes, depending on the speed of your network ..."
apt-get -y update >/dev/null 2>&1

################################################
# apt-fast
mssg "Installing apt-fast to try speed things up ..."
apt-get install -y aria2 --no-install-recommends >/dev/null 2>&1
filetowget=apt-fast
if [[ ! -f $filetowget ]]; then
   wget https://raw.githubusercontent.com/ilikenwf/apt-fast/master/apt-fast >/dev/null 2>&1
   cp apt-fast /usr/bin/
   chmod +x /usr/bin/apt-fast
fi
filetowget=apt-fast.conf
if [[ ! -f $filetowget ]]; then
   wget https://raw.githubusercontent.com/ilikenwf/apt-fast/master/apt-fast.conf >/dev/null 2>&1
   cp apt-fast.conf /etc
fi

mssg "Installing pip ..."
apt-fast -y install python-pip >/dev/null 2>&1

################################################
mssg "Downloading & Installing Anaconda ..."
# Anaconda3-2020.11-Linux-x86_64.sh 	528.8M 	2020-11-18 16:45:36 	4cd48ef23a075e8555a8b6d0a8c4bae2
# Anaconda3-4.2.0-Linux-x86_64.sh   	455.9M 	2016-09-27 15:50:04 	4692f716c82deb9fa6b59d78f9f6e85c
anaconda=Anaconda3-4.2.0-Linux-x86_64.sh
if [[ ! -f $anaconda ]]; then
    wget --quiet https://repo.continuum.io/archive/$anaconda
    chmod +x $anaconda
    ./$anaconda -b -p /home/vagrant/anaconda
    echo 'export PATH="/home/vagrant/anaconda/bin:$PATH"' >> /home/vagrant/.bashrc
    source /home/vagrant/.bashrc
    chown -R vagrant:vagrant /home/vagrant/anaconda
    /home/vagrant/anaconda/bin/conda install conda-build anaconda-client anaconda-build -y -q
fi

################################################
/home/vagrant/anaconda/bin/conda install "scikit-learn==0.18" -y -q
/home/vagrant/anaconda/bin/conda install "seaborn" -y

################################################
# Theano, H5py, Keras
mssg "Installing Theano dependencies in Linux system"
apt-fast install -y python3-numpy python3-scipy python3-dev python3-pip python3-nose \
    g++ libopenblas-dev git >/dev/null 2>&1

mssg "Upgrade pip"
pip3 install --upgrade pip  # getting RuntimeError: Python 3.5 or later is required

# use conda pip to install nose
/home/vagrant/anaconda/bin/pip install nose
/home/vagrant/anaconda/bin/pip install nose_parameterized

mssg "Installing Theano"
/home/vagrant/anaconda/bin/conda install "Theano==0.8.2" -y -q

mssg "Installing Tensorflow"
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.3.0-cp35-cp35m-linux_x86_64.whl
/home/vagrant/anaconda/bin/pip install $TF_BINARY_URL >/dev/null 2>&1

mssg "Installing Keras"
/home/vagrant/anaconda/bin/conda install -c conda-forge keras=2.0.6
# mssg "Installing MXNet"
# chown -R vagrant:vagrant /home/vagrant/anaconda
# /home/vagrant/anaconda/bin/conda update -n base conda
# /home/vagrant/anaconda/bin/conda install -c pjmtdw mxnet=0.10.0
# mssg "Trying to install py-mxnet"
# /home/vagrant/anaconda/bin/conda install -c anaconda py-mxnet
# mssg "Trying to install mxnet"
# /home/vagrant/anaconda/bin/conda install -c anaconda mxnet

################################################
# Other Python packages
/home/vagrant/anaconda/bin/pip install --verbose -r /home/vagrant/requirements.txt

################################################
mssg "Downloading a few datasets to get started with some of the Jupyter Notebooks"
mkdir -p /home/vagrant/datasets/uci
wget http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data -O /home/vagrant/datasets/uci/pima-indians-diabetes.csv -nv
chown vagrant:vagrant /home/vagrant/datasets -R

echo ""
mssg "List of installed packages"
/home/vagrant/anaconda/bin/pip list

mssg "Upgrade pip"
/home/vagrant/anaconda/bin/pip install --upgrade pip # DEPRECATION: Python 3.5 reached the end of its life on September 13th, 2020.

mssg "Set the timezone"
echo 'Asia/Singapore' | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

mssg "Done!"
