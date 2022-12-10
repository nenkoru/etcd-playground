FROM ubuntu:20.04

EXPOSE 2379 2380

ARG USERNAME=etcd-user
ARG USER_UID=1001
ARG USER_GID=1001
ARG ETCD_WORKDIR=/var/lib/etcd-data/

ARG ETCD_VER=v3.5.6
ARG GOOGLE_URL=https://storage.googleapis.com/etcd
ARG GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
ARG DOWNLOAD_URL=${GOOGLE_URL}
ARG ETCD_TAR_NAME=etcd-${ETCD_VER}-linux-amd64.tar.gz
ARG ETCD_TAR_PATH=/tmp/${ETCD_TAR_NAME}
ARG ETCD_TARGET_FOLDER=/usr/bin

RUN apt update && apt install curl -y

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME


RUN mkdir $ETCD_WORKDIR && chown $USERNAME:$USERNAME -R $ETCD_WORKDIR

RUN curl -L $DOWNLOAD_URL/$ETCD_VER/$ETCD_TAR_NAME -o $ETCD_TAR_PATH

RUN tar xzvf $ETCD_TAR_PATH -C $ETCD_TARGET_FOLDER --strip-components=1 && rm -f $ETCD_TAR_PATH

USER $USERNAME

WORKDIR $ETCD_WORKDIR

