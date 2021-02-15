FROM ubuntu:20.04
ENV TZ=America/Los_Angeles

# dependencies
#	alsa-base \
#	alsa-tools \
#	alsa-utils \
#	pulseaudio \

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	dbus \
	dbus-x11 \
	desktop-file-utils \
	fonts-symbola \
	gnupg2 \
	hicolor-icon-theme \
	libcanberra-gtk* \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpangox-1.0-0 \
	libpulse0 \
	libv4l-0 \
        nvidia-driver-455 \
	ubuntu-desktop \
	&& rm -rf /var/lib/apt/lists/*

# nvidia

RUN apt-get update && apt-get install -y --no-install-recommends \
	gnupg2 curl ca-certificates && \
	curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add - && \
	echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
	echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
	apt-get purge --autoremove -y curl \
	&& rm -rf /var/lib/apt/lists/*

ENV CUDA_VERSION 11.1.1

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	cuda-cudart-11-1=11.1.74-1 \
	cuda-compat-11-1 \
	&& ln -s cuda-11.1 /usr/local/cuda && \
	rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=11.1 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=440,driver<441 brand=tesla,driver>=450,driver<451"

# signal

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	gnupg2 wget ca-certificates && \
	wget -O- https://updates.signal.org/desktop/apt/keys.asc | apt-key add - \
	&& echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
	signal-desktop \
	&& apt-get purge --auto-remove -y wget \
	&& rm -rf /var/lib/apt/lists/*


RUN groupadd -r signal && useradd -r -g signal -G audio,video signal \
    && mkdir -p /home/signal/Downloads && chown -R signal:signal /home/signal

USER signal
WORKDIR /home/signal

ENTRYPOINT [ "/usr/bin/bash" ]
