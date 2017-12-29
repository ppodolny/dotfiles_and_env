#!/usr/bin/env bash
#
# this script bootstraps a new working environment on ubuntu, tested on 16.04.x

set -e 
set -u

sudo apt-get update

# system stuff
sudo apt-get install -y sysstat strace ltrace htop nload nmap tmux rsync \
wget curl clustershell sysdig apt-file tree wireshark

# dev stuff
sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext ccze pv jq  \
python-pip git meld vim git-extras unzip pigz ccze pv ipython parallel xchat terminator 

# multimedia etc
sudo apt-get install -y vlc nicotine calibre

# oracle jdk8
sudo apt-get install -y python-software-properties debconf-utils && \
sudo add-apt-repository -y ppa:webupd8team/java && \
sudo apt-get update && \
sudo bash -c  'echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections' && \
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
virtualbox_version='5.2.2'
sudo bash -c "echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' >> /etc/apt/sources.list.d/vbox.list"
sudo apt-get update && \
sudo apt-get install virtualbox-${virtualbox_version} -y

# vagrant
vagrant_version="2.0.1"
wget https://releases.hashicorp.com/vagrant/${vagrant_version}/vagrant_${vagrant_version}_x86_64.deb -P /tmp && \
sudo dpkg -i /tmp/vagrant_${vagrant_version}_x86_64.deb && \rm /tmp/vagrant*.deb

# docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' && \
sudo apt-get update && \
sudo apt-get install -y docker-engine && \
sudo systemctl status docker && \
sudo usermod -aG docker $(whoami)

# k8s
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# pip stuff
sudo pip install pip --upgrade

# install pip packages globally
sudo pip install pylint flake8 autopep8 awscli pyenv \
requests simplejson boto3 setuptools PyYAML ansible \
Jinja2 argparse click pylintv 

# fzf-addon for bash
cd /tmp ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ruby stuff
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# externall projects
mkdir -p ~/git/external

# tmux-css
git clone https://github.com/dennishafemann/tmux-cssh ~/git/external
