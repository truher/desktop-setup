#!/usr/bin/bash
# is this causing my chrome crashes?
# --security-opt seccomp=$PWD/chrome.json \
# --security-opt seccomp:unconfined \
# --cpuset-cpus 0-5 \
# --memory 512mb \
# TODO: make GPU work. maybe this is just for CUDA. dont need that for chrome

xhost local:root
sudo docker run \
    --cpus 6 \
    --device /dev/snd \
    --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    --gpus all \
    -it \
    --memory 32gb \
    --memory-swap 32gb \
    --net host \
    --rm \
    --oom-kill-disable \
    --security-opt seccomp:unconfined \
    -v /dev/shm:/dev/shm \
    -v $PWD/signal.sh:/home/chrome/signal.sh:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    joel/signal
