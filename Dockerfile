FROM amazonlinux:latest

ENV NODE_VERSION 6.10.3

RUN yum update -y \
      && yum install -y gcc44 gcc-c++ libgcc44 \
      && yum install -y libjpeg-devel libpng-devel libjasper-devel libtiff-devel openssl-devel

RUN curl -s -L -O https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz \
      && tar -zxvf node-v${NODE_VERSION}.tar.gz \
      && cd node-v${NODE_VERSION} && ./configure && make && make install \
      && cd .. && rm node-v${NODE_VERSION}.tar.gz

CMD [ "node" ]
