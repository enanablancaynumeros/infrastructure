include jupyter_hub/.env

build_jupyter_hub:
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
	vagrant up && \
    ansible-playbook jupyterhub.yml -e recreate_images=true --vault-password-file ~/.vault_pass.txt

only_deploy_jupyterhub:
	cd ansible && \
	vagrant up && \
    ansible-playbook jupyterhub.yml --tags deploy --vault-password-file ~/.vault_pass.txt