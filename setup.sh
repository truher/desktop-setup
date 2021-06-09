#!/usr/bin/bash

echo =====
echo ===== setup ...
echo =====
echo ===== upgrade ubuntu ...
echo =====

sudo apt-get --no-install-recommends --quiet --assume-yes update
sudo apt-get --no-install-recommends --quiet --assume-yes upgrade

# this is the current (dec 2020) recommended
sudo apt-get --no-install-recommends --quiet --assume-yes install nvidia-driver-455

echo =====
echo ===== from https://docs.docker.com/engine/install/ubuntu/
echo =====
echo ===== setup docker repo ...
echo =====

sudo apt-get --no-install-recommends --quiet --assume-yes install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo =====
echo ===== install docker engine ...
echo =====

sudo apt-get update
sudo apt-get --no-install-recommends --quiet --assume-yes install docker-ce docker-ce-cli containerd.io

# i think this is just for CUDA?
# sudo apt-get install nvidia-container-runtime

echo =====
echo ===== run hello world ...
echo =====

sudo docker run hello-world

echo =====
echo ===== from https://docs.docker.com/engine/install/linux-postinstall/
echo ===== ... skipping the docker group
echo ===== start on boot

sudo systemctl enable docker

echo =====
echo ===== nvidia docker
echo =====

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get --no-install-recommends --quiet --assume-yes install nvidia-docker2

echo =====
echo ===== restart docker
echo =====

sudo systemctl restart docker

echo =====
echo ===== try docker run nvidia-smi
echo =====

sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

echo =====
echo ===== for chrome
echo =====
echo ===== permissions
echo =====

chmod a+rwx $HOME/Documents

echo =====
echo ===== chrome itself from the Dockerfile I give up
echo =====

#sudo apt-get update
#sudo apt-get install -y --no-install-recommends \
        #gnupg2
curl -sSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
        && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y --no-install-recommends google-chrome-stable

echo =====
echo ===== for git
echo =====
echo ===== git itself I give up
echo =====

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    vim

git config --global core.editor "vim"
git config --global user.name "Joel Truher"
git config --global user.email joel@truher.org


echo =====
echo ===== make a key if there isnt one. add it to github
echo =====

test -f $HOME/.ssh/id_ed25519 || ssh-keygen -q -t ed25519 -f $HOME/.ssh/id_ed25519 -C "joel@truher.org"

echo =====
echo ===== gnome stuff
echo =====

sudo apt install gnome-shell-extension-autohidetopbar

echo =====
echo ===== signal
echo =====

# NOTE: These instructions only work for 64 bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
  sudo apt-key add -

# 2. Add our repository to your list of repositories
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
sudo apt update && sudo apt install signal-desktop

echo =====
echo ===== slack
echo =====

sudo snap install slack --classic

echo =====
echo ===== ... done!
echo =====

# also
# sudo apt install ./zoom_amd64.deb

sudo apt install bluez bluez-tools

sudo apt install ffmpeg vlc

# gah, python graphics

sudo apt install python3-pip

python3 -m pip install matplotlib
python3 -m pip install scipy
python3 -m pip install pandas
python3 -m pip install lmfit
python3 -m pip install tensorflow
python3 -m pip install scikit-learn
python3 -m pip install seaborn
python3 -m pip install pydot
python3 -m pip install label-studio
python3 -m pip install tensorflow_addons
python3 -m pip install jupyterlab

sudo apt install audacity
sudo apt install musescore3
sudo apt install ghex
sudo apt install graphviz
sudo apt install tree
sudo apt install ant


#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
#sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
#sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
#sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
#sudo apt-get update
#sudo apt-get -y install cuda
# i fucking hate nvidia
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
# somehow my libc6  is 9.3, but 9.2 is what cuda wants.
# so fucking downgrade it
# sudo apt install libc6=2.31-0ubuntu9.2
# sudo apt update
# sudo apt upgrade
# sudo apt install build-essential
# sudo apt install cuda
# ok that worked
# but libcudnn still not there?
# https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html
# my fucking god, nvidia requires login to get it
# sudo dpkg -i libcudnn8_8.2.0.53-1+cuda11.3_amd64.deb 
# sudo dpkg -i libcudnn8-dev_8.2.0.53-1+cuda11.3_amd64.deb 
# sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
# sudo apt-get install libfreeimage3 libfreeimage-dev
# and now TF can see it.
