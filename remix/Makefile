NODE_IMAGE := node:21-bookworm

DEVEL_USER  := $(shell id -un)
DEVEL_UID   := $(shell id -u)
DEVEL_GROUP := $(shell id -gn)
DEVEL_GID   := $(shell id -g)

create_env:
	sudo docker container run -it --rm \
		-v ${PWD}/project:/project \
		-v /project/node_modules \
		-w /project \
		-u root \
		${NODE_IMAGE} /bin/bash -c "\
		    groupadd -g ${DEVEL_GID} ${DEVEL_GROUP} \
		    && useradd -g ${DEVEL_GID} -u ${DEVEL_UID} -m -s /bin/bash ${DEVEL_USER} \
		    && chown -R ${DEVEL_USER}:${DEVEL_GROUP} /project/node_modules \
		    && su ${DEVEL_USER} \
		"

.PHONY: build_image
build_image:
	sudo docker-compose build --build-arg NODE_IMAGE=${NODE_IMAGE}
