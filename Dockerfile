# Dockerfile for scottabernethy/debian
FROM debian:jessie

# Install base tools (previously had installed git, man, software-properties-common, wget)
RUN apt-get update && apt-get -y install \
	curl \
	htop \
	locales \
	unzip \
	vim-tiny \
	&& rm -rf /var/lib/apt/lists/*

# Install gosu for easy step-down from root
RUN \
	gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
	curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" && \
	curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" && \
	gpg --verify /usr/local/bin/gosu.asc && \
	rm /usr/local/bin/gosu.asc && \
	chmod +x /usr/local/bin/gosu

# Set the locale
RUN dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
