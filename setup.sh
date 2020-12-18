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

sudo =====
sudo ===== nvidia docker
sudo =====

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get --no-install-recommends --quiet --assume-yes install nvidia-docker2

sudo systemctl restart docker

sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

echo =====
echo ===== for chrome
echo =====
echo ===== permissions
echo =====

chmod a+rwx $HOME/Documents

echo =====
echo ===== for git
echo =====
echo ===== make a key if there isnt one. add it to github
echo =====

test -f $HOME/.ssh/id_ed25519 || ssh-keygen -q -t ed25519 -f $HOME/.ssh/id_ed25519 -C "joel@truher.org"

echo =====
echo ===== ... done!
echo =====
