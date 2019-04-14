FROM tloriato/multichain-node:2.2.0
MAINTAINER tloriato

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip python-mysqldb \
        && pip install pycrypto \
        && pip install py-ubjson \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && wget https://github.com/sdec-brasil/worker/archive/master.tar.gz \
    && tar -xvzf master.tar.gz \
    && rm -Rf master.tar.gz

RUN cd /root/worker-master \
    && python setup.py install --user

COPY ./setupexplorer.sh /root/setupexplorer.sh
RUN chmod a+x /root/setupexplorer.sh

EXPOSE 2750

CMD ["/bin/bash", "/root/setupexplorer.sh"]
