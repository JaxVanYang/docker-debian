# NOTE!: This file is noly for local development
# USE WITH CAUTION!

.PHONY: all attach start stop run build clean

IMAGE_NAME := riscv64-jammy-builder
CONTAINER_NAME := riscv64-jammy-builder
SSHD_PORT := 1022

all: stop clean build run

attach:
	docker attach ${CONTAINER_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	-docker stop ${CONTAINER_NAME}

run:
	docker run -dit -e "JENKINS_AGENT_SSH_PUBKEY=$${JENKINS_AGENT_SSH_PUBKEY}" \
		-p 1022:22 --rm --name ${CONTAINER_NAME} ${IMAGE_NAME}

build:
	docker build -t ${IMAGE_NAME} --force-rm .

clean:
	-docker rm ${CONTAINER_NAME}
	-docker rmi ${IMAGE_NAME}
