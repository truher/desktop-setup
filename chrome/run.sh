#!/usr/bin/bash

xhost local:root
sudo docker run \
    --cpuset-cpus 0 \
    --device /dev/snd \
    --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -it \
    --memory 512mb \
    --net host \
    --rm \
    --security-opt seccomp=$PWD/chrome.json \
    -v /dev/shm:/dev/shm \
    -v $HOME/Documents:/home/chrome/Documents \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    joel/chrome
