FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    python3 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash python
USER python
WORKDIR /home/python

EXPOSE 8000

ENTRYPOINT [ "/usr/bin/bash" ]
