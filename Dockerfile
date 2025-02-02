FROM ghcr.io/linuxserver/baseimage-rdesktop:focal

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive \
 apt-get install --no-install-recommends -y \
	firefox \
	mousepad \
	xfce4-terminal \
	xfce4 \
	xubuntu-default-settings \
	xubuntu-icon-theme && \
 echo "**** cleanup ****" && \
 apt-get autoclean && \
 rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

# add local files
COPY /root /
