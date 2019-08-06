FROM tloriato/multichain-node:2.2.0
MAINTAINER tloriato

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip python-mysqldb git \
        && pip install pycrypto \
        && pip install redis \
        && pip install py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*