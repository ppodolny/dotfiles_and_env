#!/usr/bin/env bash
#
# this script bootstraps a new working environment on ubuntu, tested on 14.04.x , 16.04.x

set -e 
set -u

sudo apt-get update

# system stuff
sudo apt-get install -y sysstat strace ltrace htop nload nmap tmux rsync wget curl clustershell sysdig apt-file tree

# dev stuff
sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext ccze pv jq  \
python-pipgit meld vim git-extras unzip pigz ccze pv ipython parallel xchat terminator 

# multimedia etc
sudo apt-get install -y vlc nicotine

# oracle jdk8
sudo apt-get install -y python-software-properties debconf-utils && \
sudo add-apt-repository -y ppa:webupd8team/java && \
sudo apt-get update && \
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
sudo apt-get install -y oracle-java8-installer

# sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3 && \
sudo apt-get update && \
sudo apt-get install -y sublime-text-installer && \
# pycharm
sudo wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list' && \
sudo apt-get update && \
sudo apt-get install pycharm -y

# virtualbox
sudo bash -c "echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' >> /etc/apt/sources.list.d/vbox.list"
sudo apt-get update && \
sudo apt-get install virtualbox-5.0 -y

# vagrant
vagrant_version="1.8.5"
wget https://releases.hashicorp.com/vagrant/${vagrant_version}/vagrant_${vagrant_version}_x86_64.deb -P /tmp && \
sudo dpkg -i /tmp/vagrant_${vagrant_version}_x86_64.deb && \rm /tmp/vagrant*.deb

# pip stuff
sudo pip install pip --upgrade
sudo pip install awscli virtualenv requests simplejson boto setuptools PyYAML ansible Jinja2 argparse click pylintv virtualenvwrapper.project

# fzf addon for bash
cd /tmp ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ruby stuff
\curl -sSL https://get.rvm.io | bash -s stable --ruby
