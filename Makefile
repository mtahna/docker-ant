# Set jdk and ant version.
ant_ver  := 1.10.8
ostype   := centos7
javatype := oracle
jdk_ver  := jdk8


# Set Argument.
src := .
cmd := ant


# Variables used internally.
DOCKER_IMAGE   := ant:$(ant_ver)-$(ostype)-$(javatype)-$(jdk_ver)
MOUNT_HOST_DIR := $(shell readlink -f $(src))
MOUNT_CONT_DIR := /home/project
WORK_DIR       := $(MOUNT_CONT_DIR)
EXEC_COMMAND   := $(cmd)


build: 
	docker build ./ -t $(DOCKER_IMAGE) --build-arg ANT_VER=$(ant_ver) -f Dockerfile.$(ostype).$(javatype).$(jdk_ver)

run: 
	docker run -it --rm -v $(MOUNT_HOST_DIR):$(MOUNT_CONT_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) $(EXEC_COMMAND)

help:
	@echo "Do the following when creating an docker image."
	@echo "% make build"
	@echo ""
	@echo "Do the following when executing Ant build."
	@echo "% make run src=[Target Source] cmd=[Target Command]" 

