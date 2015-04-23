# Dockerfile for scottabernethy/debian
FROM debian:jessie

# Install and setup project dependencies
RUN apt-get update && apt-get -y install \
	curl \
	git \
	htop \
	locales \
	man \
	software-properties-common \
	unzip \
	vim-tiny \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# Set the locale
RUN dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

# Service dir
RUN mkdir -p /service
WORKDIR /service
