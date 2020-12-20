#!/usr/bin/bash
#    --cpuset-cpus 0 \
#    --cpus 6 \
#    --device /dev/snd \
#    --device /dev/dri \
#    --memory 512mb \
#    -v /dev/shm:/dev/shm \
#    -v $HOME/.ssh:/home/git/.ssh:ro \
#    -v $PWD/gitconfig:/etc/gitconfig:ro \

sudo docker run \
    -it \
    --rm \
    --net host \
    -v $HOME:/home/lcd \
    joel/lcd
