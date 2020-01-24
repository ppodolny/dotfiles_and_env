#!/usr/bin/env bash
#
# this script bootstraps a new working environment on ubuntu, tested on 16.04.x

set -e 
set -u

sudo apt-get update

# system stuff
sudo apt-get install -y sysstat strace ltrace htop nload nmap tmux rsync iperf \
wget curl clustershell sysdig apt-file tree

# dev stuff
sudo apt-get install -y npm build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext ccze pv jq  \
python-pip git meld vim git-extras unzip pigz ccze pv ipython parallel xchat terminator nodejs 

# multimedia etc
sudo apt-get install -y vlc nicotine calibre

# openjdk9
sudo apt-get install -y openjdk-9-jdk

# sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3 && \
sudo apt-get update && \
sudo apt-get install -y sublime-text-installer && \

# pycharm
sudo wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list' && \
sudo apt-get update && \
sudo apt-get install pycharm -y

# minikube & virtualbox
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian  $(lsb_release -a|grep Codename|awk -F: '{print $NF}'|awk '{print $1}') contrib"  > /etc/apt/sources.list.d/vbox.list
sudo apt-get update
sudo apt-get install virtualbox-6.1 -y
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
  
#terraform
tf_version="0.12.20"
wget https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip -P /tmp
cd !$; unzip terraform*.zip
sudo \rm /tmp/terraform*.zip 
sudo mv /tmp/terraform /usr/local/bin/terraform

# docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' && \
sudo apt-get update && \
sudo apt-get install -y docker-engine && \
sudo systemctl status docker && \
sudo usermod -aG docker $(whoami)

# k8s stuff
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo 'source <(kubectl completion bash)' >> ~/.bashrc

# pip stuff
sudo pip install pip --upgrade

# install pip packages
pip install pylint flake8 autopep8 awscli pyenv \
requests simplejson boto3 setuptools PyYAML ansible \
Jinja2 argparse click pylintv 
 
# serverless framework
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g serverless

# fzf-addon for bash
cd /tmp ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ruby stuff
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# tmux-css
git clone https://github.com/dennishafemann/tmux-cssh ~/git/external
