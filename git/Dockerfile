FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    git \
    openssh-client \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash git
USER git
WORKDIR /home/git

ENTRYPOINT [ "/usr/bin/bash" ]
