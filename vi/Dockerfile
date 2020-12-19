FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    vim \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash vi
USER vi
WORKDIR /home/vi

#ENTRYPOINT [ "/usr/bin/vim" ]
ENTRYPOINT [ "/usr/bin/bash" ]
