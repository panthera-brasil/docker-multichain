FROM tloriato/multichain-node:2.1.0
MAINTAINER tloriato

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip python-mysqldb \
        && pip install pycrypto \
        && pip install py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && wget https://github.com/sdec-brasil/worker/archive/0.0.2.tar.gz \
    && tar -xvzf 0.0.2.tar.gz \
    && rm -Rf 0.0.2.tar.gz

RUN cd /root/worker-0.0.2 \
    && python setup.py install --user

ADD ./runexplorer.sh /root/runexplorer.sh
RUN chmod a+x /root/runexplorer.sh

CMD ["/bin/bash", "/root/runexplorer.sh"]
