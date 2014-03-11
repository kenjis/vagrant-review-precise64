# Re:VIEW Execution Environment with Vagrant (Ubuntu 12.04, 64bit)

[日本語](README.ja.md)

"Re:VIEW" is a easy-to-use digital publishing system for books and ebooks.

This repository provides a virutal machine which you can run Re:VIEW right now.

## Requirements

* VirtualBox ... Free virtualization software [Download Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Vagrant 1.3+ ... Tool for working with VirtualBox images [Download Vagrant](http://downloads.vagrantup.com/)

### Tested

* Ubuntu 12.04 ... VirtualBox 4.2.18 & Vagrant 1.5.0
* Mac OS X 10.8.5 ... VirtualBox 4.3.6 & Vagrant 1.4.3

## What's in the Virtual Machine?

* Tex Live
* Re:VIEW ... latest development version on GitHub (installed as ~/review/)

## Setup & Layout

Create review-project folder, and put your Re:VIEW files into it.

	$ mkdir review-project
	$ cd review-project

Clone this repository as vagrant in review-project folder.

	$ git clone git@github.com:kenjis/vagrant-review-precise64 vagrant

Or download [Zip file](https://github.com/kenjis/vagrant-review-precise64/archive/master.zip) and extract it and put the folder as vagrant.

Setup your directories like this:

	review-project/
	review-project/vagrant

## How to use

### 1. on Host OS

	$ cd review-project/vagrant
	$ vagrant up    # run virtual machine

Note the first `vagrant up` takes long time (a few hours?), because it downloads virtual machine image file, and start virtual machine, and downloads/install a lot of software to use.

	$ vagrant ssh   # connect to virtual machine via SSH

### 2. on Virtual Machine

	$ cd ~/review-project
	$ review-pdfmaker sample.yaml   # run review command
	$ review-epubmaker sample.yaml  # run review command

## How to use Vagrant

Here are a few common commands:

* `vagrant up` ... starts the virtual machine and provisions it
* `vagrant suspend` ... will save the current running state of the machine and stop it
* `vagrant halt` ... attempts a graceful shutdown of the machine
* `vagrant ssh` ... gives you SSH access to the virtual machine

More in http://docs.vagrantup.com/v2/

## Related URL

* Re:VIEW offical repository https://github.com/kmuto/review
* Re:VIEW Wiki https://github.com/kmuto/review/wiki
* Re:VIEW sample data (Japanese) https://github.com/takahashim/review-sample-book
* Re:VIEW Tips (Japanese) http://qiita.com/tags/review/items
