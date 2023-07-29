.PHONY: build
build:
	docker image build . -t my-ubuntu \
		--build-arg BASE_IMAGE="ubuntu:22.10"

.PHONY: build_mac
build_mac:
	docker image build . -t my-ubuntu \
		--build-arg BASE_IMAGE="arm64v8/ubuntu:22.10"

# これも書いておくと make shell でコンテナのシェルに入れるので楽です
.PHONY: shell
shell:
	docker container run -it --rm my-ubuntu /bin/bash