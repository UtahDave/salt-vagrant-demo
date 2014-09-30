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
    vagrant up


This will download an Ubuntu  VirtualBox image and create three virtual
machines for you. One will be a Salt Master named `master` and two will be
Salt Minions named `minion` and `minion2`.  The Salt Minions will point to
the Salt Master. You can then run the following commands to log into the
Salt Master and begin using Salt.

.. code-block:: bash
    vagrant ssh master
    sudo salt-key -L
    sudo salt-key -A
    sudo salt \* test.ping
