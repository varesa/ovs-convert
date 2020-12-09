FROM centos:8

RUN dnf install -y centos-release-ansible-29 && \
    dnf install -y ansible openssh-clients && \
    ansible-galaxy collection install openvswitch.openvswitch

COPY . /work/
