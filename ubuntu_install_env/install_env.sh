#!/usr/bin/env bash

set -e 
set -u

sudo apt-get update

# system stuff
sudo apt-get install -y sysstat strace ltrace htop nload nmap tmux wget curl clustershell sysdig apt-file

# dev stuff
sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip pigz ccze pv
sudo apt-get install -y python-pip python-virtualenv git meld vim git-extras unzip pigz ccze pv

# oracle jdk8
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y virtualbox

# sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer 

# pycharm
sudo wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo apt-get update
sudo apt-get install pycharm -y

# vagrant
vagrant_version="1.8.1"
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_${vagrant_version}_x86_64.deb -P /tmp && \
sudo dpkg -i /tmp/vagrant_${vagrant_version}_x86_64.deb && \rm /tmp/vagrant*.deb

# pip stuff
sudo pip install awscli requests simplejson boto setuptools PyYAML ansible Jinja2 --upgrade
