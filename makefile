include jupyter_hub/.env

build_jupyter_hub: volumes
	cd jupyter_hub && \
    docker-compose build

run_jupyter_hub:
	cd jupyter_hub && \
    docker-compose up -d jupyterhub

docker_logs:
	cd jupyter_hub && \
    docker-compose logs

deploy_jupyterhub:
	cd ansible && \
    ansible-playbook jupyterhub.yml

only_deploy_jupyterhub:
	cd ansible && \
    ansible-playbook jupyterhub.yml --tags deploy