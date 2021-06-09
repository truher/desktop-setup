FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#RUN pip3 install --no-cache-dir --no-compile pylint --upgrade
#RUN python3 -m pip install mypy
#RUN python3 -m pip install waitress
#RUN python3 -m pip install flask
#RUN python3 -m pip install pandas
#RUN python3 -m pip install matplotlib
#RUN python3 -m pip install scipy
# TODO: finish setting up glances
# RUN python3 -m pip install 'glances[web]'
RUN python3 -m pip install ish_parser
RUN python3 -m pip install pytz

RUN useradd -ms /bin/bash python
USER python
WORKDIR /home/python

EXPOSE 8000

ENTRYPOINT [ "/usr/bin/bash" ]
