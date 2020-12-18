#!/usr/bin/bash
#    --cpuset-cpus 0 \

sudo docker run \
    --cpus 6 \
    --device /dev/snd \
    --device /dev/dri \
    -it \
    --memory 512mb \
    --net host \
    --rm \
    -v /dev/shm:/dev/shm \
    -v $HOME/.ssh:/home/git/.ssh:ro \
    -v $HOME:/home/git \
    -v $PWD/gitconfig:/etc/gitconfig:ro \
    joel/git
