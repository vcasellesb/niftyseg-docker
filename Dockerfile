FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y cmake cmake-curses-gui \
    gcc g++ libeigen3-dev git

RUN git clone https://github.com/KCL-BMEIS/NiftySeg.git

WORKDIR /NiftySeg/build

RUN CXX=/usr/bin/g++ CC=/usr/bin/gcc cmake ../ && \
    make && make install

RUN rm -rf /NiftySeg