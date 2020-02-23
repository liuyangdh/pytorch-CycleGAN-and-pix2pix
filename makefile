GPUS_TRAIN:=3


build:
	docker build -t p2p .

enter_docker:
	build
	docker run --rm -it -p 8042:8042 --gpus '"device=${GPUS_TRAIN}"' -v /home/lya/p2p:/p2p p2p /bin/bash