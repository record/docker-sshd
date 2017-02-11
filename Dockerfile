FROM ubuntu:16.04

RUN apt-get -qq update && \
    apt-get -qq install -y openssh-server && \
    apt-get -qq clean

RUN apt-get -qq update && \
    apt-get -qq install -y sudo && \
    apt-get -qq clean

RUN useradd --password ubuntu -G sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-ubuntu && \
    mkdir /var/run/sshd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
