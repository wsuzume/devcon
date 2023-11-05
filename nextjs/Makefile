NODE_IMAGE := node:21-bookworm

DEVEL_USER  := $(shell id -un)
DEVEL_UID   := $(shell id -u)
DEVEL_GROUP := $(shell id -gn)
DEVEL_GID   := $(shell id -g)

.PHONY: devel
devel:
	sudo docker container run -it --rm \
		-v ${PWD}/app:/app \
		-w /app \
		-u root \
		${NODE_IMAGE} /bin/bash -c "\
		    groupadd -g ${DEVEL_GID} ${DEVEL_GROUP} \
		    && useradd -g ${DEVEL_GID} -u ${DEVEL_UID} -m -s /bin/bash ${DEVEL_USER} \
		    && su ${DEVEL_USER} \
		"
