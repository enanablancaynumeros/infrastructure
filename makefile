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

volumes:
	@docker volume inspect $(DATA_VOLUME_HOST) >/dev/null 2>&1 || docker volume create --name $(DATA_VOLUME_HOST)
