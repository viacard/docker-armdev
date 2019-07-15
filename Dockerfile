FROM bitnami/minideb
MAINTAINER mats@viacard.com

USER root
WORKDIR /root

# Install required packages
RUN 	apt-get update && \
	apt-get --silent install -y joe vim curl bzip2 git make && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/

# Get the gcc-arm compiler from arm.com and unpack it to /usr/local/bin
RUN	curl -\# -L "https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2" | \
	tar -C /usr/local/bin/ -xj 

# Copy tarballs pre-created from original installations and unpack them to /usr/local
COPY 	arm.tar.bz2 atmel.tar.bz2 /root/
RUN 	tar -xj -C /usr/local/ -f arm.tar.bz2 && \ 
	tar -xj -C /usr/local/ -f atmel.tar.bz2 && \
	rm *.bz2
