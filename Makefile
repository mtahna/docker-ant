# Set jdk and ant version.
vendor  := oracle
jdk_ver := jdk8
ant_ver := 1.10.8


# Set Argument.
src := .
cmd := ant


# Variables used internally.
DOCKER_IMAGE  := ant:$(ant_ver)-$(vendor)-$(jdk_ver)
MOUNT_SRC_DIR := $(shell readlink -f $(src))
MOUNT_DST_DIR := /home/project
WORK_DIR      := $(MOUNT_DST_DIR)
EXEC_COMMAND  := $(cmd)


build: 
	docker build ./ -t $(DOCKER_IMAGE) --build-arg ANT_VER=$(ant_ver) -f Dockerfile.$(vendor).$(jdk_ver)

run: 
	docker run -it --rm -v $(MOUNT_SRC_DIR):$(MOUNT_DST_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) $(EXEC_COMMAND)

help:
	@echo "Do the following when creating an docker image."
	@echo "% make build"
	@echo ""
	@echo "Do the following when executing Ant build."
	@echo "% make run -src [Target Source] -cmd [Target Command]" 

