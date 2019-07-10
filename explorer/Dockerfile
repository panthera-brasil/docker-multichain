FROM tloriato/multichain-node:2.2.0
MAINTAINER tloriato

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip python-mysqldb git \
        && pip install pycrypto \
        && pip install py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && git clone https://github.com/sdec-brasil/worker/ \
    && cd worker \
    && git checkout new-structure \
    && python setup.py install --user

COPY ./setupexplorer.sh /etc/my_init.d/setupexplorer.sh
RUN chmod +x /etc/my_init.d/setupexplorer.sh

RUN mkdir /etc/service/worker
COPY ./worker.sh /etc/service/worker/run
RUN chmod +x /etc/service/worker/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
