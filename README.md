Deep Learning Virtual Machine
===============================
This is a VirtualBox VM that is automatically generated using Vagrant.

Machine Learning and Deep Learning packages installed are: Scikit-Learn, NLTK, [Keras](https://keras.io/), [TensorFlow](https://www.tensorflow.org/) and [Theano](http://deeplearning.net/software/theano/). A [Vagrant](https://www.vagrantup.com/) file is used to generate this VM, which runs on Ubuntu 14.04 (`trusty64`)

### Getting Started

*   This VM should work in Windows, macOS and Linux

*   VirtualBox (version 6+) is required

*   [Download and install Vagrant](http://www.vagrantup.com/downloads.html) 

*   Change to the folder where this repo has been cloned and type on your local terminal:

    ```
    vagrant up
    ```

*   To access the virtual machine console or terminal, type:

    ```
    vagrant ssh
    ```

*   When finished, power off the virtual machine with:

    ```
    vagrant halt
    ```

    

### What's Installed

- Deep Learning
  - Keras 2.0.6
  - TensorFlow 1.3.0
  - Theano 0.8.2
- Machine Learning
    - sklearn 0.18
    - nltk 3.2.1
- Python
  - Anaconda3 Python 3.5.2
  - numpy 1.11.1
  - scipy 0.18.1
  - matplotlib 1.5.3
  - bokeh 0.12.2
  - pandas, 0.18.1
  - seaborn 0.9.0
  - jupyter 1.0.0
  - jupyter_core 4.2.0
  - ipython 5.1.0
  - h5py 2.6.0
  - pip 8.1.2



## Jupyter notebook server

Jupyter notebook server is available at the host's browser at http://localhost:8100. 

Password : `password`



## Testing

There are several notebooks to test the deep learning packages:

*   [test_keras.ipynb](http://127.0.0.1:8100/notebooks/test_keras.ipynb)
*   [test_tensorflow.ipynb](http://127.0.0.1:8100/notebooks/test_tensorflow.ipynb)
*   [theano_test.ipynb](http://127.0.0.1:8100/notebooks/theano_test.ipynb)
*   [test_loop_packages.ipynb](http://127.0.0.1:8100/notebooks/test_loop_packages.ipynb): check the versions of the main installed packages


## Other
* Disk size: 40 GB
* RAM: 4096 GB
* CPUs: 2
* Network: NAT
* USB: off
* Shared folder: 2


## Codes machine name

* `t64`: Ubuntu Trusty 64-bit
* `sh`: shell script provisioning
* `jpy`: Jupyter server
* `rss`: RStudio Server
* `th`: Theano
* `tf`: TensorFlow
* `ke`: Keras
* `skl`: scikit-learn
* -`apy`: Anaconda Python followed by version number
