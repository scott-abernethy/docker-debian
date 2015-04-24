# Dockerfile for scottabernethy/debian
FROM debian:wheezy

# Install base tools (previously had installed git, htop, man, software-properties-common, wget)
RUN apt-get update && apt-get -y install \
	curl \
	locales \
	unzip \
	vim-tiny \
	&& rm -rf /var/lib/apt/lists/*

# Set the locale
RUN dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

# Service dir
RUN mkdir -p /service
WORKDIR /service
