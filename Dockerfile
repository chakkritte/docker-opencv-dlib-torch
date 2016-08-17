FROM ubuntu:14.04.5
MAINTAINER Chakkrit Termritthikun <chakkritte57@nu.ac.th>

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    gfortran \
    git \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python-dev \
    python-numpy \
    python-protobuf\
    software-properties-common \
    zip \
    wget \
    ipython3 \
    libssl-dev \
    libzmq3-dev \
    python-zmq \
    python-pip \
    && apt-get upgrade -q -y  \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
RUN \
    git clone https://github.com/torch/distro.git ~/torch --recursive && \
    cd ~/torch; bash install-deps;

RUN \
    chmod a+x /root/torch/install.sh
    
RUN \ 
    cd ~/torch && \
    ./install.sh && \
    cd install/bin && \
    ./luarocks install nn && \
    ./luarocks install dpnn && \
    ./luarocks install image && \
    ./luarocks install optim && \
    ./luarocks install csvigo && \
    ./luarocks install torchx && \
    ./luarocks install tds
