FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get  install -y  sudo &&\
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS her0elt
ARG TAGS
RUN groupadd --gid 1000 hermanoe \
    && useradd --uid 1000 --gid hermanoe --shell /bin/bash --create-home hermanoe \
    &&  echo "hermanoe:root" | chpasswd
RUN usermod -aG sudo hermanoe
USER hermanoe
ENV USER=hermanoe
WORKDIR /home/hermanoe

FROM her0elt
COPY . ./setup
CMD ["sh", "-c", "ansible-playbook $TAGS setup/local.yml"]
