FROM ubuntu:16.04

RUN apt-get -qq update && \
    apt-get -qq install -y openssh-server && \
    apt-get -qq clean

RUN mkdir /var/run/sshd && \
    echo "root:root" | chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
