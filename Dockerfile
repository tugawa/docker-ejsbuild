FROM ubuntu:18.04

RUN http_proxy=http://proxy.noc.kochi-tech.ac.jp:3128 apt-get update
RUN http_proxy=http://proxy.noc.kochi-tech.ac.jp:3128 apt-get install --no-install-recommends --no-install-suggests -y less openssh-server gcc-8-arm-linux-gnueabihf ruby ant make git ocaml automake libparmap-ocaml-dev g++-8-arm-linux-gnueabihf

RUN service ssh start
RUN https_proxy=http://proxy.noc.kochi-tech.ac.jp:3128 git clone https://github.com/coccinelle/coccinelle.git && cd coccinelle && ./autogen && ./configure && make install
