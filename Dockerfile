FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y cmake cmake-curses-gui \
    gcc g++ libeigen3-dev

COPY src/ /niftyseg/src

RUN mkdir /niftyseg/build /niftyseg/install

WORKDIR /niftyseg/build

RUN CXX=/usr/bin/g++ CC=/usr/bin/gcc cmake ../src/ && \
    make && make install

WORKDIR /

RUN rm -rf /niftyseg