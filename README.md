How to run a jupyterhub server on a RHEL7.1 server.
Able to replicate everything locally in a vagrant machine with centos/7.
It relies on PAM authentication system. So each user is required to have a user in the docker container running jupyterhub.
Use python2.7 as docker_image module is not compatible with it.

Check the Makefile to have an overview of the project.  