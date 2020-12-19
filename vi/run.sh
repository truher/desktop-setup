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

sudo docker run \
    -it \
    --rm \
    -v $HOME:/home/vi \
    joel/vi
