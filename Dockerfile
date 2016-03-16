#####################################################
## installs gcc make git bc
## installs FUSE (File System in User Space)
## compiles a simple hello.c filesystem
## run the container with these params: 
## 	--cap-add SYS_ADMIN --device /dev/fuse
#####################################################

# set the base image
FROM ubuntu

RUN export VERSION=2.9.5 && \
    apt-get update && \
	apt-get install -y wget pkg-config gcc make git bc && \
	mkdir /fs-proj && \
	cd /fs-proj && \
	wget -q https://github.com/libfuse/libfuse/releases/download/fuse_2_9_5/fuse-2.9.5.tar.gz && \
	tar -xvzf fuse-${VERSION}.tar.gz && \
	cd fuse-${VERSION} && \
    ./configure && \
    make -j8 && \
    make install

WORKDIR /fs-proj