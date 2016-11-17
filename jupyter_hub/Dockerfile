# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyterhub/jupyterhub-onbuild:0.6.1

RUN /opt/conda/bin/pip install --upgrade pip setuptools wheel

# Install dockerspawner and its dependencies
RUN /opt/conda/bin/pip install \
    jupyterhub==0.6.* \
    dockerspawner==0.5.* \
    notebook==4.2.*

# install docker on the jupyterhub container
RUN wget https://get.docker.com -q -O /tmp/getdocker && \
    chmod +x /tmp/getdocker && \
    sh /tmp/getdocker

# Copy TLS certificate and key
ENV SSL_CERT /srv/jupyterhub/secrets/jupyterhub.crt
ENV SSL_KEY /srv/jupyterhub/secrets/jupyterhub.key
COPY ./secrets/*.crt $SSL_CERT
COPY ./secrets/*.key $SSL_KEY
RUN chmod 700 /srv/jupyterhub/secrets && \
    chmod 600 /srv/jupyterhub/secrets/*

COPY ./userlist /srv/jupyterhub/userlist