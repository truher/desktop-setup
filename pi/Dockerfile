FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        gnupg2 curl ca-certificates && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /home

ENTRYPOINT [ "/usr/bin/bash" ]
