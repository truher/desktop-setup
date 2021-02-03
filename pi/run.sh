#!/usr/bin/bash
#    --cpuset-cpus 0 \
#    --cpus 6 \
#    --device /dev/snd \
#    --device /dev/dri \
#    --net host \
#    -v /dev/shm:/dev/shm \
#    -v $HOME/.ssh:/home/git/.ssh:ro \
#    -v $PWD/gitconfig:/etc/gitconfig:ro \
#    --memory 512mb \
#    -v $PWD:/home/vi \
#    joel/vi "$@"

xhost local:root
sudo docker run \
    -it \
    --net host \
    --rm \
    --security-opt seccomp:unconfined \
    -v $HOME:/home \
    joel/pi
