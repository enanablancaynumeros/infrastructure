include jupyter_hub/.env

build_jupyter_hub:
	$(MAKE) decrypt_files && \
	cd jupyter_hub && \
    docker-compose build && \
    cd .. && \
    $(MAKE) encrypt_files

decrypt_files:
	ansible-vault decrypt jupyter_hub/config/users.txt --vault-password-file ~/.vault_pass.txt

encrypt_files:
	ansible-vault encrypt jupyter_hub/config/users.txt --vault-password-file ~/.vault_pass.txt

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


create_volume_network:
	docker network create $(shell echo ${DOCKER_NETWORK_NAME}) && \
    docker volume create --name=$(shell echo ${DATA_VOLUME_HOST})