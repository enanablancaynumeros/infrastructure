# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyterhub/jupyterhub:latest

# install docker on the jupyterhub container
RUN wget https://get.docker.com -q -O /tmp/getdocker && \
    chmod +x /tmp/getdocker && \
    sh /tmp/getdocker

RUN /opt/conda/bin/pip install --upgrade pip wheel

# Install dockerspawner and its dependencies
RUN /opt/conda/bin/pip install \
    jupyterhub==0.7.* \
    dockerspawner==0.5.* \
    notebook==4.2.*

RUN adduser test
RUN echo test:test | chpasswd

ADD config/server.crt /srv/jupyterhub/server.crt
ADD config/server.key /srv/jupyterhub/server.key

ADD config/jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py