FROM tloriato/multichain-node:2.2.0
MAINTAINER tloriato

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip python-mysqldb \
        && pip install pycrypto \
        && pip install py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && wget https://github.com/sdec-brasil/worker/archive/1.0.1.tar.gz \
    && tar -xvzf 1.0.1.tar.gz \
    && rm -Rf 1.0.1.tar.gz

RUN cd /root/worker-1.0.1 \
    && python setup.py install --user

COPY ./setupexplorer.sh /root/setupexplorer.sh
RUN chmod a+x /root/setupexplorer.sh

EXPOSE 2750

CMD ["/bin/bash", "/root/setupexplorer.sh"]
