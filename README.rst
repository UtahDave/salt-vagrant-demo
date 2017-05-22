=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/UtahDave/salt-vagrant-demo.git
    cd salt-vagrant-demo
    vagrant plugin install vagrant-vbguest
    vagrant up


This will download an Ubuntu VirtualBox image and create five virtual
machines for you. One will be a Salt Master named `master` and four will be Salt
Minions of various releases of Ubuntu and CentOS.  They are named `minion-ubuntu14`
(trusty), `minion-ubuntu16` (xenial), `minion-centos6` and `minion-centos7`.
The Salt Minions will point to the Salt Master and the Minion's keys will already
be accepted.  Because the keys are pre-generated and reside in the repo, please
be sure to regenerate new keys if you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping
