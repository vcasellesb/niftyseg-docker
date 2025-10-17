FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y cmake \
    cmake-curses-gui \
    gcc \
    g++ \
    libeigen3-dev \
    git && \
    rm -rf /var/lib/apt/lists/*


COPY niftyseg-git /niftyseg

WORKDIR /niftyseg

RUN mkdir build && \
    cd build && \
    CXX=/usr/bin/g++ CC=/usr/bin/gcc cmake ../ && \
    make && \
    make install

RUN rm -rf /niftyseg