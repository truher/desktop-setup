# from https://blog.jessfraz.com/post/docker-containers-on-the-desktop/ 

FROM ubuntu:20.04
ENV TZ=America/Los_Angeles

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	hicolor-icon-theme \
	libcanberra-gtk* \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpangox-1.0-0 \
	libpulse0 \
	libv4l-0 \
	fonts-symbola \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome /home/chrome

USER chrome

ENTRYPOINT [ "/usr/bin/bash" ]
